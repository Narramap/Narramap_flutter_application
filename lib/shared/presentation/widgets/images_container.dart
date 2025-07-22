import 'package:flutter/material.dart';

class ImagesContainer extends StatefulWidget {
  final List<String> images;

  const ImagesContainer({
    super.key,
    required this.images,
  });

  @override
  State<ImagesContainer> createState() => _ImagesContainerState();
}

class _ImagesContainerState extends State<ImagesContainer> {
  int _index = 0;

  void _incrementIndex() {
    setState(() {
      _index = (_index + 1) % widget.images.length;
    });
  }

  void _decrementIndex() {
    setState(() {
      _index = (_index - 1 + widget.images.length) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen principal
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(widget.images[_index]),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Botón izquierdo (atrás)
        if(widget.images.length > 1)
          ...[
            Positioned(
            left: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(130),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: _decrementIndex,
                  color: Colors.black,
                  iconSize: 20,
                ),
              ),
            ),
          ),

          // Botón derecho (adelante)
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(130),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: _incrementIndex,
                  color: Colors.black,
                  iconSize: 20,
                ),
              ),
            ),
          ),
        ]
        
        
      ],
    );
  }
}
