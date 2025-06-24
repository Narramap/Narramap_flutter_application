
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/core/widgets/custom_bottom_navigation_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Position? location;

  void getLocation () async {
    location = await LocationService().getCurrentLocation();
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 100,
        title: Image.asset(
              "assets/images/logo_narramap.png",
              width: 70,
            )
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              "assets/images/map_background.png",
              fit: BoxFit.cover,
            )
          ),

          Positioned.fill(
            child: Opacity(
              opacity: 1,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(19.4326, -99.1332), // CDMX
                  initialZoom: 13.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c', 'd'],
                    userAgentPackageName: 'com.tuapp.nombre',
                  ),
                ],
              ),
            )
          )
            
        ],
      ),
    );
  }
}