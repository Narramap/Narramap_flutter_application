import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final void Function(List<File>)? onImagesSelected;
  final String title;

  const CustomImagePicker({
    super.key,
    required this.title,
    required this.onImagesSelected,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  List<File> _imagesSelected = [];
  CameraController? _cameraController;
  bool _cameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _cameraController = CameraController(camera, ResolutionPreset.medium);
    await _cameraController!.initialize();

    setState(() {
      _cameraInitialized = true;
    });
  }

  Future<void> _pickImagesFromGallery() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      setState(() {
        _imagesSelected.addAll(pickedFiles.map((file) => File(file.path)));
      });
      widget.onImagesSelected?.call(_imagesSelected);
    }
  }

  Future<void> _captureImageFromCamera() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      final file = await _cameraController!.takePicture();
      final image = File(file.path);

      setState(() {
        _imagesSelected.add(image);
      });

      widget.onImagesSelected?.call(_imagesSelected);
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imagesSelected.removeAt(index);
    });
    widget.onImagesSelected?.call(_imagesSelected);
  }

  void _resetSelection() {
    setState(() {
      _imagesSelected.clear();
    });
    widget.onImagesSelected?.call(_imagesSelected);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasImages = _imagesSelected.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(color: Color(0xFF474747)),
        ),
        const SizedBox(height: 20),

        // Contenedor con borde dashed y vista previa de cámara
        CustomPaint(
          painter: DashedBorderPainter(),
          child: Container(
            width: double.infinity,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: _cameraInitialized
                ? AspectRatio(
                    aspectRatio: _cameraController!.value.aspectRatio,
                    child: CameraPreview(_cameraController!),
                  )
                : const Center(child: CircularProgressIndicator()),

            ),
          ),
        ),
        const SizedBox(height: 10),

        // Botones de acción
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            // Tomar foto
            IconButton(
              onPressed: _captureImageFromCamera,
              icon: const Text("📸", style: TextStyle(fontSize: 28)),
              tooltip: "Tomar foto",
            ),

            // Retomar o cambiar cámara
            IconButton(
              onPressed: _resetSelection,
              icon: const Text("🔄", style: TextStyle(fontSize: 28)),
              tooltip: "Cambiar cámara",
            ),

            // Galería
            IconButton(
              onPressed: _pickImagesFromGallery,
              icon: const Text("🖼️", style: TextStyle(fontSize: 28)),
              tooltip: "Elegir de galería",
            ),

            // Agregar más desde cámara
            
          ],
        ),

        const SizedBox(height: 10),

        // Miniaturas de imágenes seleccionadas
        if (hasImages)
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _imagesSelected.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(_imagesSelected[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 2,
                      child: GestureDetector(
                        onTap: () => _removeImage(index),
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.black54,
                          child: Icon(Icons.close, size: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final double strokeWidth;
  final double borderRadius;

  DashedBorderPainter({
    this.dashWidth = 5.0,
    this.dashSpace = 4.0,
    this.color = const Color(0xFFE2E2E2),
    this.strokeWidth = 2.0,
    this.borderRadius = 15.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius)));

    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final segment = metric.extractPath(
          distance,
          distance + dashWidth,
        );
        canvas.drawPath(segment, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
