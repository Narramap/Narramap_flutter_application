
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';
import 'package:narramap/map/presentation/notifiers/map_notifier.dart';
import 'package:narramap/map/presentation/screen/utils/get_circle_events.dart';
import 'package:narramap/map/presentation/screen/utils/get_events_markers.dart';
import 'package:narramap/map/presentation/screen/utils/get_posts_markers.dart';
import 'package:narramap/map/presentation/screen/widget/bussiness_modal.dart';
import 'package:narramap/map/presentation/screen/widget/emotional_posts_info.dart';
import 'package:narramap/map/presentation/screen/widget/event_modal.dart';
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

    return ChangeNotifierProvider(
        create: (context) => MapNotifier(),
        builder: (context, _) {

          final notifier = Provider.of<MapNotifier>(context, listen: false);

          return FutureBuilder(
            future: notifier.getAll(), 
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return StackableScaffold(
                  positionedStackableContent: EmotionalPostsInfo(onChange: notifier.onChangeLayer),
                  child: Consumer<MapNotifier>(
                  builder: (context, notifier, _) => FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(notifier.currentLocation!.latitude, notifier.currentLocation!.longitude),
                      initialZoom: 15.0,
                      minZoom: 13.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: notifier.layer.layerUrl,
                        subdomains: notifier.layer.domains,
                        userAgentPackageName: 'com.narramap.app',
                      ),
                      
                      CircleLayer(
                        circles: getCircleEvents(notifier.events)
                      ),
                      
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: notifier.currentLocation!, 
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text("TU"),
                            )
                          ),
                          ...getPostsMarkers(
                            context: context,
                            posts: notifier.emotionalPosts,
                            onTapPostMarker: notifier.registerPostView,
                            reportPost: notifier.reportPost,
                            onChangeReason: notifier.onChangeReason
                          ),
                          ...getEventsMarkers(
                            context, 
                            notifier.events, 
                            showEventModal
                          ),
                          ...notifier.bussiness.map(
                            (bussiness) => Marker(
                              point: bussiness.location.toLatLng(),
                              child: GestureDetector(
                                onTap: () => showBussinessModal(context, bussiness),
                                child: Icon(
                                  Icons.store,
                                  size: 25,
                                  color: Colors.deepOrangeAccent,
                                ),
                            ))
                          )
                        ]
                      ),
                    ],
                  )
                )
                );
              }
            },
          );
        }
    );


    
  }

}