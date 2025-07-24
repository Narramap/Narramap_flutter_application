import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/shared/presentation/widgets/map_widget.dart';

class UbicationSelector extends StatefulWidget {

  final double heightMap;
  final Function(LatLng) onSelectLocation;
  final List<Marker> markers;
  final List<CircleMarker> circleMarkers;
  final String label;
  final LatLng? initialCenter;

  const UbicationSelector({
    super.key,
    required this.heightMap,
    required this.label,
    required this.onSelectLocation,
    required this.markers,
    required this.circleMarkers,
    this.initialCenter,
  });

  @override
  State<UbicationSelector> createState() => _UbicationSelectorState();
}

class _UbicationSelectorState extends State<UbicationSelector> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Color(0xFF474747)
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        MapWidget(
          intialCenter: widget.initialCenter,
          heightMap: widget.heightMap,
          markers: widget.markers,
          circleMarkers: widget.circleMarkers,
          onSelectLocation: widget.onSelectLocation,
          borderRadius: 20,
        )
      ],
    );
  }
}