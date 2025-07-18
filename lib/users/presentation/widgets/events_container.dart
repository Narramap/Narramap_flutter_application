
import 'package:flutter/material.dart';
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/event_card.dart';
import 'package:narramap/users/domain/model/user.dart';
import 'package:narramap/users/domain/model/user_profile.dart';

class EventsContainer extends StatelessWidget {

  final List<Event> events;
  final UserProfile user;
  const EventsContainer({
    super.key,
    required this.events,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          "Tus Eventos Creados",
          style: TextStyle(
            fontSize: 20,
            color: TextColor.gray.textColor
          ),
        ),
        ...events.map((event) => EventCard(event: event, user: user))
      ],
    );
  }
}