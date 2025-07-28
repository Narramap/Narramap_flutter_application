
import 'package:flutter/material.dart';

enum Emotions {

  rage(
    label: "enojo",
    color: Color(0xFFFB4949),
    id: 0
  ),
  happiness(
    label: "alegria",
    color: Color(0xFFFBA349),
    id: 1
  ),
  serenity(
    label: "serenidad",
    color: Color(0xFF49DDEE),
    id: 2
  ),
  love(
    label: "amor",
    color: Colors.white,
    id: 3
  ),
  sadness(
    label: "dolor",
    color: Color.fromARGB(255, 44, 44, 44),
    id: 4
  );

  final String label;
  final Color color;
  final int id;

  const Emotions({
    required this.label,
    required this.color,
    required this.id
  });

  factory Emotions.fromId(int id) {
    return Emotions.values.firstWhere((value) => value.id == id);
  }

}