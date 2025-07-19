
import 'package:flutter/material.dart';

enum Emotions {

  rage(
    label: "enojo",
    color: Color(0xFFFB4949)
  ),
  happiness(
    label: "alegria",
    color: Color(0xFFFBA349)
  ),
  serenity(
    label: "serenidad",
    color: Color(0xFF49DDEE)
  ),
  love(
    label: "amor",
    color: Colors.white
  ),
  sadness(
    label: "dolor",
    color: Color.fromARGB(255, 44, 44, 44)
  );

  final String label;
  final Color color;

  const Emotions({
    required this.label,
    required this.color
  });

}