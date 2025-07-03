
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:narramap/map/presentation/notifiers/map_notifier.dart';
import 'package:narramap/map/presentation/screen/utils/get_circle_layers.dart';
import 'package:narramap/map/presentation/screen/utils/get_posts_markers.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return StackableScaffold(
      child: ChangeNotifierProvider(
        create: (context) => MapNotifier(),
        builder: (context, _) {

          final notifier = Provider.of<MapNotifier>(context, listen: false);

          return FutureBuilder(
            future: notifier.getAll(), 
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Consumer<MapNotifier>(
                  builder: (context, notifier, _) => FlutterMap(
                    options: MapOptions(
                      initialCenter: notifier.currentLocation!,
                      initialZoom: 15.0,
                      minZoom: 13.0
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                        subdomains: ['a', 'b', 'c', 'd'],
                        userAgentPackageName: 'com.tuapp.nombre',
                      ),
                      CircleLayer(
                        circles: getCircleLayers(notifier.emotionsZones)
                      ),
                      MarkerLayer(
                        markers: [
                            Marker(
                              point: notifier.currentLocation!, 
                              child: Icon(
                                Icons.accessibility_sharp,
                                color: Colors.white,
                              )
                            ),
                            ...getPostsMarkers(notifier.posts)
                          ]
                      ),
                    ],
                  )
                );
              }
            },
          );
        }
      )
    );


    return ChangeNotifierProvider<MapNotifier>(
      create: (context) => MapNotifier(),
      builder: (context, _){

        final notifier = Provider.of<MapNotifier>(context, listen: false);

        return Scaffold(
          extendBody: true, // Importante para que el fondo se vea tras el nav bar
          backgroundColor: Colors.transparent,
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 10,
            children: [
              FloatingActionButton(
                onPressed: () => context.push(Routes.addEvent.label),
                backgroundColor: Color(0xFFF2F2F2),
                child: Text("📅", style: TextStyle(fontSize: 20)),
              ),
              FloatingActionButton(
                onPressed: () => context.push(Routes.addEco.label),
                backgroundColor: Color(0xFFF2F2F2),
                child: Text("💭", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 70,)
            ],
          ),
          body: FutureBuilder(
            future: notifier.getAll(), 
            builder: (context, snapshot) {

              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Consumer<MapNotifier>(
                  builder: (context, notifier, _) => Stack(
                    children: [
                      /// Capa de mapa (MapLayer)
                      Positioned.fill(
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(16.7362798, -93.1007208),
                            initialZoom: 15.0,
                            minZoom: 13.0
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                              subdomains: ['a', 'b', 'c', 'd'],
                              userAgentPackageName: 'com.tuapp.nombre',
                            ),
                            CircleLayer(
                              circles: getCircleLayers(notifier.emotionsZones)
                            ),
                            MarkerLayer(
                              markers: getPostsMarkers(notifier.posts)
                            ),
                          ],
                        ),
                      ),
                
                      Positioned(
                        top: 50, // Ajusta este valor según tu padding superior
                        left: 20,
                        right: 20,
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/logo_narramap.png",
                            width: 70,
                          ),
                        ),
                      ),
                
                      /// Bottom Navigation flotante sobre el mapa
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: CustomBottomNavigationBar(),
                      ),
                    ],
                  ),
                );
              }
              
            }
          ) 
        );
      },
    );
  }

}