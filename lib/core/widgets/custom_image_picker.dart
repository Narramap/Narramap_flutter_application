import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final void Function(File)? onImageSelected;
  final String title;

  const CustomImagePicker({
    super.key,
    required this.title,
    required this.onImageSelected,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _imageFile;
  List<File>? _imagesSelected;
  int currentIndex = 0;

  void _incrementIndex() {

    currentIndex == _imagesSelected!.length - 1 ? 
      setState(() {
        currentIndex = 0;
      })
    :
      setState(() {
        currentIndex += 1;
      });      
  }

  void _decrementIndex() {
    currentIndex == 0 ? 
      setState(() {
        currentIndex = _imagesSelected!.length - 1;
      })
    :
      setState(() {
        currentIndex -= 1;
      });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    setState(() {
      _imagesSelected = pickedFiles.map((file) => File(file.path)).toList();
    });

    // if (pickedFile != null) {
    //   setState(() {
    //     _imageFile = File(pickedFile.path);
    //   });

    //   if (widget.onImageSelected != null) {
    //     widget.onImageSelected!(_imageFile!);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: Color(0xFF474747)),
          ),
          const SizedBox(height: 10),
          CustomPaint(
            painter: DashedBorderPainter(),
            child: Container(
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: _imagesSelected != null
                    ? Stack(
                      children: [
                        Positioned.fill(
                          child: Image.file(
                            _imagesSelected![currentIndex],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),

                        Positioned.fill(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: _decrementIndex, 
                                  icon: Icon(Icons.arrow_back_ios_new)
                                ),
                                IconButton(
                                  onPressed: _incrementIndex, 
                                  icon: Icon(Icons.arrow_forward_ios)
                                )
                              ],
                            ),
                          )
                        )
                        
                      ]
                    )
                    : const Center(
                        child: Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Color(0xFFE2E2E2),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
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
