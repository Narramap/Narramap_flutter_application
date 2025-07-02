import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/widgets/map_widget.dart';

class UbicationSelector extends StatefulWidget {

  final Function(LatLng) onSelectLocation;
  final List<Marker> markers;
  final List<CircleMarker> circleMarkers;
  final String label;
  const UbicationSelector({
    super.key,
    required this.label,
    required this.onSelectLocation,
    required this.markers,
    required this.circleMarkers
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
          markers: widget.markers,
          circleMarkers: widget.circleMarkers,
          onSelectLocation: widget.onSelectLocation,
          borderRadius: 20,
        )
      ],
    );
  }
}