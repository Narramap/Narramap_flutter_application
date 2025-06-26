import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {

  final void Function(File)? onImageSelected;
  final String title;
  const CustomImagePicker({
    super.key,
    required this.title,
    required this.onImageSelected
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {

  File? _imageFile; 

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // o .camera

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      if (widget.onImageSelected != null) {
        widget.onImageSelected!(_imageFile!);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Column(
        children: [
          Text(widget.title),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFFE2E2E2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xFFE2E2E2))
            ),

            child: _imageFile != null 
            ? ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                _imageFile!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            )
            : const Center(
              child: Icon(
                Icons.add_a_photo, 
                size: 40, 
                color: Color(0xFFE2E2E2)
              )
            )
          )
        ],
      ),
    );
  }
}