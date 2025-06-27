import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/widgets/map_widget.dart';

class UbicationSelector extends StatefulWidget {

  final Function(LatLng) onSelectLocation;
  final String label;
  UbicationSelector({
    super.key,
    required this.label,
    required this.onSelectLocation
  });

  @override
  State<UbicationSelector> createState() => _UbicationSelectorState();
}

class _UbicationSelectorState extends State<UbicationSelector> {
  List<Marker> markers = [];

  void _onSelectLocation(LatLng location) {
    setState(() {
      markers = [
        Marker(
          point: location, 
          child: Icon(
            Icons.location_on,  
            color: Colors.red,
            size: 20,
          )
        )
      ];
    });
    widget.onSelectLocation(location);
  }

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
          markers: markers,
          onSelectLocation: _onSelectLocation,
          borderRadius: 20,
        )
      ],
    );
  }
}