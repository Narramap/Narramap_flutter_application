import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class ProfilePhotoPicker extends StatefulWidget {

  final String? defaultPhoto;
  final Function(File) onSelectImage;
  final bool editing;
  const ProfilePhotoPicker({
    super.key,
    required this.editing,
    required this.onSelectImage,
    this.defaultPhoto
  });

  @override
  State<ProfilePhotoPicker> createState() => _ProfilePhotoPickerState();
}

class _ProfilePhotoPickerState extends State<ProfilePhotoPicker> {

  File? _imageSelected;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageSelected = File(pickedFile.path);
      });
      widget.onSelectImage.call(_imageSelected!);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        GestureDetector(
          onTap: widget.editing ? () => _pickImageFromGallery() : null,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: _imageSelected != null ? 
              FileImage(_imageSelected!)
            :
              widget.defaultPhoto != null ? 
              NetworkImage(widget.defaultPhoto!) 
            :
              AssetImage("assets/images/default_profile_photo.webp"),
          ),
        ),
        SizedBox(height: 10),
        if(widget.editing)
          Text(
            "toque la foto de perfil para cambiarla", 
            style: TextStyle(color: TextColor.gray.textColor),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}