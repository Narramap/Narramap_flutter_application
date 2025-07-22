
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:narramap/content/data/dto/reaction_to_post_dto.dart';
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/content/domain/model/post.dart';
import 'package:narramap/map/domain/model/emotion_enum.dart';

List<Marker> getEventsMarkers(
  BuildContext context,
  List<Event> events, 
  void Function(BuildContext context, Event event) showModal,
) {
  return events.map(
    (event) => Marker(
    point: event.location, 
    child: GestureDetector(
      onTap: () => showModal(context, event),
      child: Icon(
          Icons.circle,
          color: Colors.white,
          size: 20,
        ),
    )

    )
  ).toList();
}