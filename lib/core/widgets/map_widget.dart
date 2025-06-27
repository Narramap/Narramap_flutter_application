import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/Location/location_service.dart';

class MapWidget extends StatefulWidget {

  final Function(LatLng location)? onSelectLocation;
  final List<Marker> markers;
  final double borderRadius;
  const MapWidget({
    super.key,
    this.markers = const [],
    this.onSelectLocation,
    this.borderRadius = 0
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  Position? location;
  bool locationGetted = false;

  void getLocation () async {
    var current = await LocationService().getCurrentLocation();
    print("location obtenida $current");
    setState(() {
      location = current;
      locationGetted = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return location != null ?  ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius)
        ),
        width: double.infinity,
        height: 500,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(location!.latitude, location!.longitude), // CDMX
            initialZoom: 13.0,
            minZoom: 10,
            onTap: widget.onSelectLocation != null ? 
            (tapPosition, point) => widget.onSelectLocation!(point) : null
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
              userAgentPackageName: 'com.tuapp.nombre',
            ),
            MarkerLayer(
              markers: widget.markers
            )
          ]
        ),
      ),
    ) : !locationGetted ? 
    Center(
      child: CircularProgressIndicator(),
    ) : 
    Center(
      child: Text("No fue posible obtener su ubicacion"),
    );

    
  }
}