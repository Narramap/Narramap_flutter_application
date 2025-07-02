
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:narramap/map/domain/model/emotions_zone.dart';

List<CircleMarker> getCircleLayers(List<EmotionsZone> zones) {

  return zones.map(
    (zone) => CircleMarker(
      point: zone.location,
      radius: zone.radius,
      color: zone.emotion.color.withAlpha(120),
      borderColor: Colors.transparent,
      borderStrokeWidth: 0,
      useRadiusInMeter: true
    )
  ).toList();

}