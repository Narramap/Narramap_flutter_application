import 'package:flutter/foundation.dart';

enum EventEnum {
  academic(label: "ACADÉMICO"),
  artistic(label: "ARTÍSTICO"),
  cultural(label: "CULTURAL"),
  musical(label: "MUSICAL"),
  political(label: "POLÍTICO"),
  promotional(label: "PROMOCIONAL"),
  social(label: "SOCIAL"),
  sports(label: "DEPORTIVO");

  final String label;

  const EventEnum({required this.label});

  factory EventEnum.fromString(String value) {
    return EventEnum.values.firstWhere((enumValue) => enumValue.label == value);
  }
}