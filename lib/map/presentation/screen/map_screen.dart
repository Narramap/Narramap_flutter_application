
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/Location/location_service.dart';
import 'package:narramap/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:narramap/map/presentation/widgets/selector_add_modal.dart';

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

  _showSelectorModal(BuildContext context) {
    showGeneralDialog(
      context: context, 
      pageBuilder: (context, animation, secondaryAnimation) => SelectorAddModal()
    );
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
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _showSelectorModal(context), 
            child: Icon(Icons.add_circle_outlined),
          )
         
        ],
      ),
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
                  initialCenter: LatLng(16.7362798, -93.1007208), // CDMX
                  initialZoom: 13.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                    subdomains: ['a', 'b', 'c', 'd'],
                    userAgentPackageName: 'com.tuapp.nombre',
                  ),

                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(16.7362798, -93.1007208),
                        child: Icon(Icons.location_on_rounded, color: Colors.red, size: 40,)
                      )
                    ]
                  )
                ],
              ),
            )
          )
            
        ],
      ),
    );
  }
}