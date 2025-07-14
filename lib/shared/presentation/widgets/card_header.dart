import 'package:flutter/material.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class CardHeader extends StatelessWidget {

  final String userImage;
  final String title;
  final DateTime date;
  const CardHeader({
    super.key,
    required this.userImage,
    required this.title,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userImage),
          radius: 20,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: TextColor.gray.textColor,
                  overflow: TextOverflow.ellipsis
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                
              ),
              Text(
                "${ date.day.toString().padLeft(2, "0")} / ${date.month.toString().padLeft(2, "0")} / ${date.year}",
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