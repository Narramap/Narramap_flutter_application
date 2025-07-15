
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/shared/presentation/widgets/card_header.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/ubication_selector.dart';
import 'package:narramap/users/domain/model/user.dart';

class EventCard extends StatelessWidget {

  final Event event;
  final User user;
  const EventCard({
    super.key,
    required this.event,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CardHeader(
          userImage: user.imageUrl, 
          title: event.title, 
          date: event.date
        ),
        Text(
          event.description,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: TextColor.gray.textColor
          ),
        ),
        UbicationSelector(
          heightMap: 300,
          label: "", 
          onSelectLocation: (point) {}, 
          markers: [
            Marker(
              point: event.location, 
              child: Icon(
                Icons.circle,
                color: Colors.white,
              )
            )
          ], 
          circleMarkers: [
            CircleMarker(
              point: event.location, 
              radius: event.radius.toDouble(),
              useRadiusInMeter: true,
              color: Colors.red.withAlpha(120)
            )
          ]
        )

      ],
    );
  }
}