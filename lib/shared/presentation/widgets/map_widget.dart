import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/map/domain/model/layers_enum.dart';

class MapWidget extends StatefulWidget {
  
  final double heightMap;
  final Function(LatLng location)? onSelectLocation;
  final List<Marker> markers;
  final List<CircleMarker> circleMarkers;
  final double borderRadius;
  final LatLng? intialCenter;
  const MapWidget({
    super.key,
    required this.heightMap,
    this.markers = const [],
    this.circleMarkers = const [],
    this.onSelectLocation,
    this.borderRadius = 0,
    this.intialCenter
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  Position? location;
  bool locationGetted = false;

  void getLocation () async {
    var current = await LocationService().getCurrentLocation();
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
        height: widget.heightMap,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: widget.intialCenter ?? LatLng(location!.latitude, location!.longitude),
            initialZoom: 15.0,
            minZoom: 13,
            onTap: widget.onSelectLocation != null ? 
            (tapPosition, point) => widget.onSelectLocation!(point) : null
          ),
          children: [
            TileLayer(
              urlTemplate: LayersEnum.labeledWhite.layerUrl,
              subdomains: LayersEnum.labeledWhite.domains,
              userAgentPackageName: 'com.tuapp.nombre',
            ),
            CircleLayer(
              circles: widget.circleMarkers
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