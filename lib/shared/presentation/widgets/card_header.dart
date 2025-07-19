import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class CardHeader extends StatefulWidget {

  final String? userImage;
  final String title;
  final DateTime date;
  final String userId;
  final bool searchImage;
  final Future<String?> Function(String)? getImage;

  const CardHeader({
    super.key,
    this.userImage,
    required this.title,
    required this.date,
    required this.userId,
    this.searchImage = false,
    this.getImage
  });

  @override
  State<CardHeader> createState() => _CardHeaderState();
}

class _CardHeaderState extends State<CardHeader> {

  String? _imageUrl;

  void _fetchData() async {
    if(widget.userImage == null && widget.searchImage && widget.getImage != null) {

      final profilePhoto = await widget.getImage!(widget.userId);
      print(profilePhoto);
      if(profilePhoto != null){
        setState(() {
          _imageUrl = profilePhoto;
        });
      }
    } else if ( widget.userImage != null) {
      _imageUrl = widget.userImage;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.push("pendiente de asginar"),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: _imageUrl != null ? 
              NetworkImage(_imageUrl!) 
            : 
              AssetImage("assets/images/default_profile_photo.webp")
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: TextColor.gray.textColor,
                  overflow: TextOverflow.ellipsis
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                
              ),
              Text(
                "${ widget.date.day.toString().padLeft(2, "0")} / ${widget.date.month.toString().padLeft(2, "0")} / ${widget.date.year}",
                style: TextStyle(
                  color: TextColor.gray.textColor
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}