
import 'package:flutter/material.dart';

enum Emotions {

  rage(
    label: "enojo",
    color: Color(0xFFFB4949),
    id: 0,
    assetUrl: "assets/models/enojo.glb"
  ),
  happiness(
    label: "alegria",
    color: Color(0xFFFBA349),
    id: 1,
    assetUrl: "assets/models/alegria.glb"
  ),
  serenity(
    label: "serenidad",
    color: Color(0xFF49DDEE),
    id: 2,
    assetUrl: "assets/models/tranquilidad.glb"
  ),
  love(
    label: "amor",
    color: Colors.white,
    id: 3,
    assetUrl: "assets/models/amor.glb"
  ),
  sadness(
    label: "dolor",
    color: Color.fromARGB(255, 44, 44, 44),
    id: 4,
    assetUrl: "assets/models/tristeza.glb"
  );

  final String label;
  final Color color;
  final int id;
  final String assetUrl;

  const Emotions({
    required this.label,
    required this.color,
    required this.id,
    required this.assetUrl
  });

  factory Emotions.fromId(int id) {
    return Emotions.values.firstWhere((value) => value.id == id);
  }

}