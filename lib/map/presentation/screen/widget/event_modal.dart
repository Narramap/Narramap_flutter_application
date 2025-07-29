
import 'package:flutter/material.dart';
import 'package:narramap/events/domain/model/event.dart';
import 'package:narramap/events/presentation/widgets/event_card.dart';
import 'package:narramap/shared/utils/custom_modal.dart';

void showEventModal(BuildContext context, Event event) {

  showCustomModal(
    context, 
    EventCard(event: event)
  );

}