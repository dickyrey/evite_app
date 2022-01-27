import 'package:evite/models/event.dart';
import 'package:evite/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EventTabBarView extends StatelessWidget {
  final List<Event> events;

  const EventTabBarView({Key? key, required this.events}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var event = events[index];
        return EventCard(event: event);
      },
    );
  }
}
