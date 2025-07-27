
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/bussiness/data/dto/update_bussiness_dto.dart';
import 'package:narramap/bussiness/domain/enum/week_days_enum.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/domain/use_cases/update_bussiness_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/shared/data/enum/bussiness_type_enum.dart';
import 'package:narramap/shared/utils/datetime_parser.dart';
import 'package:narramap/shared/utils/get_base64_images.dart';

class BussinessEditableNotifier extends ChangeNotifier {

  final _updateBussinessUseCase = getIt<UpdateBussinessUseCase>();

  bool _editing = false;
  bool get editing => _editing;

  void toggleEditing() {
    _editing = !_editing;
    notifyListeners();
  }

  final Bussiness _bussiness;

  BussinessEditableNotifier(this._bussiness) {
    _name = _bussiness.name;
    _description = _bussiness.description;
    _type = _bussiness.type;
    _activeDays = _bussiness.workDays;
    _openTime = parseHour(_bussiness.openTime);
    _closeTime = parseHour(_bussiness.closeTime);
    _location = _bussiness.location.toLatLng();
  }

  late String _name;
  String get name => _name;

  late String _description;
  String get description => _description;

  late DateTime _openTime;
  DateTime get openTime => _openTime;

  late DateTime _closeTime;
  DateTime get closeTime => _closeTime;

  late LatLng _location;
  LatLng get location => _location;

  late BussinessTypeEnum _type;
  BussinessTypeEnum get type => _type;

  List<WeekDaysEnum> _activeDays = [];
  List<WeekDaysEnum> get activeDays => _activeDays;

  List<File> _images = [];
  List<File> get images => _images;

  String onChangeName(String value) {
    return _name = value;
  }

  String onChangeDescription(String value) {
    return _description = value;
  }

  void onChangeOpenTime(DateTime value) {
    _openTime = value;
    notifyListeners();
  }

  void onChangeCloseTime(DateTime value) {
    _closeTime = value;
    notifyListeners();
  }

  void onChangeLocation(LatLng value){
    _location = value;
    notifyListeners();
  }

  onChangeType(BussinessTypeEnum value) {
    _type = value;
  }

  void onChangeActiveDays(List<WeekDaysEnum> value) {
    _activeDays = value;
    notifyListeners();
  }

  void onChangeImages(List<File> value) {
    _images = value;
  }

  Future<void> saveChanges(void Function(Bussiness) setBussiness) async {
    final updateDTO = UpdateBussinessDTO(
      name: name, 
      description: description, 
      openTime: toHourMinuteTimeString(openTime), 
      closeTime: toHourMinuteTimeString(closeTime), 
      location: location, 
      bussType: type, 
      days: activeDays.map((value) => value.value).toList(), 
      imageUrls: await getBase64Images(images)
    );

    final res = await _updateBussinessUseCase.run(_bussiness.id, updateDTO);

    if(res != null){
      setBussiness(res);
    }
  }
}