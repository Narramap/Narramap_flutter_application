
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:narramap/events/domain/model/event.dart';
import 'package:narramap/events/presentation/notifiers/event_card_notifier.dart';
import 'package:narramap/shared/presentation/widgets/containers/card_header.dart';
import 'package:narramap/comments/presentation/widgets/comments_container.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/containers/images_container.dart';
import 'package:narramap/shared/presentation/widgets/inputs/ubication_selector.dart';
import 'package:narramap/users/domain/model/user_profile.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {

  final Event event;
  final UserProfile? user;
  const EventCard({
    super.key,
    required this.event,
    this.user
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventCardNotifier(event.id),
      child: Consumer<EventCardNotifier>(
        builder: (context, notifier, _) => Column(
          spacing: 10,
          children: [
            CardHeader(
              userImage: user?.profilePhoto,
              userId: event.userId,
              title: event.title, 
              getImage: notifier.getUserPhoto,
              date: event.date
            ),
            Text(
              event.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: TextColor.gray.textColor
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  event.initTime,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 30,
                    color: TextColor.gray.textColor
                  ),
                ),
                Text(
                  "-",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 30,
                    color: TextColor.gray.textColor
                  ),
                ),
                Text(
                  event.endTime,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 30,
                    color: TextColor.gray.textColor
                  ),
                ),
              ],
            ),
            

            if(event.imageUrls.isNotEmpty)
              ImagesContainer(images: event.imageUrls),
            UbicationSelector(
              initialCenter: event.location,
              heightMap: 250,
              label: "", 
              onSelectLocation: (point) {}, 
              markers: [
                Marker(
                  point: event.location, 
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                  )
                )
              ], 
              circleMarkers: [
                CircleMarker(
                  point: event.location, 
                  radius: event.radius.toDouble(),
                  useRadiusInMeter: true,
                  color: Colors.red.withAlpha(120)
                )
              ]
            ),

            Text(
              "${notifier.assistancies.length} Asistencias",
              style: TextStyle(
                color: TextColor.gray.textColor
              ),
            ),

            CustomButton(
              text: !notifier.userAsisted ? "Asisti / Asistire a este evento" : "Ya has asistido a este evento", 
              onPressed: !notifier.userAsisted ? () => notifier.registerAssistency(event.id) : () {}
            ),

            CommentsContainer(
              source: CommentSource.event,
              sourceId: event.id,
            ),
          ],
        ),
      ),
    );
  }
}