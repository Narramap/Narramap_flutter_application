
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/map/presentation/notifiers/map_notifier.dart';
import 'package:narramap/map/presentation/screen/utils/get_circle_layers.dart';
import 'package:narramap/map/presentation/screen/utils/get_posts_markers.dart';
import 'package:narramap/map/presentation/screen/widget/post_modal.dart';
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
                      initialCenter: LatLng(notifier.currentLocation!.latitude, notifier.currentLocation!.longitude),
                      initialZoom: 15.0,
                      minZoom: 13.0
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                        subdomains: ['a', 'b', 'c', 'd'],
                        userAgentPackageName: 'com.tuapp.nombre',
                      ),
                      
                      // CircleLayer(
                      //   circles: getCircleLayers(notifier.emotionsZones)
                      // ),
                      
                      MarkerLayer(
                        markers: [
                            Marker(
                              point: notifier.currentLocation!, 
                              child: Icon(
                                Icons.accessibility_sharp,
                                color: Colors.white,
                              )
                            ),
                            ...getPostsMarkers(
                              context,
                              notifier.posts,
                              showPostModal,
                              notifier.reactToPost
                            )
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


    
  }

}