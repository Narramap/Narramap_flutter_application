
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/bussiness/data/dto/register_bussiness_dto.dart';
import 'package:narramap/bussiness/domain/use_cases/register_bussiness_use_case.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/shared/data/enum/bussiness_type_enum.dart';
import 'package:narramap/shared/utils/get_base64_images.dart';

class AddBussinessNotifier extends ChangeNotifier {

  final _registerUseCase = getIt<RegisterBussinessUseCase>();

  String _name = "";
  String get name => _name;

  String _description = "";
  String get description => _description;

  BussinessTypeEnum? _bussinessType;
  BussinessTypeEnum? get bussinessType => _bussinessType;

  LatLng? _location;
  LatLng? get location => _location;

  DateTime? _openTime;
  DateTime? get openTime => _openTime;

  DateTime? _closeTime;
  DateTime? get closeTime => _closeTime;

  List<String> _activesDays = [];
  List<String> get activeDays => _activesDays;

  List<File>? _images;
  List<File>? get images => _images;

  String onChangeName(String value) {
    return _name = value;
  }

  String onChangeDescription(String value) {
    return _description = value;
  }

  void onSelectBussinessType(BussinessTypeEnum value){
    _bussinessType =  value;
  }

  void onSelectLocation(LatLng value) {
    _location = value;
    notifyListeners();
  }

  void onSelectOpenTime(DateTime value) {
    _openTime = value;
    notifyListeners();
  }

  void onSelectCloseTime(DateTime value) {
    _closeTime = value;
    notifyListeners();
  }

  void onSelectImages(List<File> values) {
    _images = values;
  }

  void onSelectActiveDays(List<String> values) {
    _activesDays = values;
    notifyListeners();
  }

  Future<void> register() async {

    if(!validateFields()){
      return;
    }

    final registerDTO = RegisterBussinessDTO(
      name: name, 
      description: description, 
      openTime: openTime!, 
      closeTime: closeTime!, 
      location: location!, 
      type: bussinessType!, 
      workDays: activeDays, 
      images: await getBase64Images(images ?? [])
    );

    final res = await _registerUseCase.run(registerDTO);

    if(res != null) {
      print("exito");
    }
  }


  bool validateFields() => 
  name != "" 
  && description != "" 
  && openTime != null 
  && closeTime != null
  && location != null
  && activeDays.isNotEmpty;


}