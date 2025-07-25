
import 'package:narramap/content/data/dto/new_post_dto.dart';
import 'package:narramap/shared/data/enum/bussiness_type_enum.dart';

class Bussiness {

  final String name;
  final String description;
  final DateTime openTime;
  final DateTime closeTime;
  final LocationDTO location;
  final BussinessTypeEnum type;
  final List<String> workDays;
  final List<String> images;

  Bussiness({
    required this.name,
    required this.description,
    required this.openTime, 
    required this.closeTime,
    required this.location,
    required this.type,
    required this.workDays,
    required this.images
  });
}