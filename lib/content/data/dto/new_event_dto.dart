import 'dart:io';

import 'package:dio/dio.dart';
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/shared/data/enum/events_enum.dart';

class NewEventDTO {
  final String userId;
  final String title;
  final String description;
  final LocationDTO location;
  final int radius;
  final DateTime date;
  final DateTime initTime;
  final DateTime endTime;
  final EventEnum eventType;
  final List<File> imageUrls;

  NewEventDTO({
    required this.userId,
    required this.title,
    required this.description,
    required this.location,
    required this.radius,
    required this.date,
    required this.initTime,
    required this.endTime,
    required this.eventType,
    required this.imageUrls,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry("id_user", userId),
      MapEntry("title", title),
      MapEntry("description", description),
      MapEntry("location_lat", location.latitude.toString()),
      MapEntry("location_lon", location.longitude.toString()),
      MapEntry("radius", radius.toString()),
      MapEntry("date_event", date.toIso8601String()),
      MapEntry("start_time", _formatTime(initTime)),
      MapEntry("end_time", _formatTime(endTime)),
      MapEntry("eventType", eventType.label),
    ]);

    for (final image in imageUrls) {
      final fileName = image.path.split('/').last;
      formData.files.add(
        MapEntry(
          "images_url",
          await MultipartFile.fromFile(image.path, filename: fileName),
        ),
      );
    }
    return formData;
  }
}

String _formatTime(DateTime time) {
  return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
}