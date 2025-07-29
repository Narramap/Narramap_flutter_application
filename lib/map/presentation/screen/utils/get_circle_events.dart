
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:narramap/events/domain/model/event.dart';

List<CircleMarker> getCircleEvents(List<Event> events) {

  return events.map(
    (event) => CircleMarker(
      point: event.location,
      radius: event.radius.toDouble(),
      color: Colors.grey.withAlpha(120),
      borderColor: Colors.transparent,
      borderStrokeWidth: 0,
      useRadiusInMeter: true
    )
  ).toList();

}