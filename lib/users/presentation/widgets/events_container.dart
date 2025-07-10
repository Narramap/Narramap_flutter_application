
import 'package:flutter/material.dart';
import 'package:narramap/content/domain/model/event.dart';
import 'package:narramap/shared/widgets/custom_switch.dart';
import 'package:narramap/shared/widgets/event_card.dart';

class EventsContainer extends StatelessWidget {

  final List<Event> events;
  const EventsContainer({
    super.key,
    required this.events
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
        ...events.map((event) => EventCard(event: event))
      ],
    );
  }
}