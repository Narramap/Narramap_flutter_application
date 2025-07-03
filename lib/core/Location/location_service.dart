import 'package:geolocator/geolocator.dart';

class LocationService {


Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Verificar si el GPS está activado
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('El servicio de ubicación está desactivado.');
  }

  // Verificar permisos
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Permiso de ubicación denegado.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Los permisos están permanentemente denegados, no podemos solicitarlos.');
  }

  // Obtener la posición actual
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  print('Ubicación actual: ${position.latitude}, ${position.longitude}');

  return position;
}

}