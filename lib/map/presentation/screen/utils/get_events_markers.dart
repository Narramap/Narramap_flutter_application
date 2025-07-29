
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:narramap/events/domain/model/event.dart';

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
          Icons.flag,
          color: Colors.redAccent,
          size: 20,
        ),
    )

    )
  ).toList();
}