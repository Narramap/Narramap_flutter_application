
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:narramap/bussiness/data/interceptors/rating_interceptor.dart';
import 'package:narramap/bussiness/presentation/widgets/rating_card.dart';
import 'package:narramap/shared/presentation/widgets/comments_container.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class BussinesNoEditableContent extends StatelessWidget {

  final double averageRate;
  final String bussinessId;
  final List<RatingInterceptor> ratings;
  const BussinesNoEditableContent({
    super.key,
    required this.averageRate,
    required this.bussinessId,
    required this.ratings
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [

        SizedBox(height: 10),
        Text(
          "Calificacion Promedio de los usuarios",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 17,
            color: TextColor.gray.textColor
          ),
        ),
    
        RatingBarIndicator(
          rating: averageRate,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ), 
          itemCount: 5,
          itemSize: 30,
          direction: Axis.horizontal,
        ),

        CommentsContainer(
          source: CommentSource.bussiness, 
          sourceId: bussinessId
        ),

        SizedBox(height: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              "Calificaciones de los usuarios",
              style: TextStyle(
                fontSize: 17,
                color: TextColor.gray.textColor
              ),
            ),
            if(ratings.isNotEmpty)
              ...ratings.map((rating) => RatingCard(rating: rating))
            else
              Text(
                "Parece que aun no hay calificaciones de los usuarios",
                style: TextStyle(
                  color: TextColor.gray.textColor
                ),
              )
          ]
        )
      ],
    );
  }
}