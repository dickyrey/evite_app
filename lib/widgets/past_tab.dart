
import 'package:evite/models/event.dart';
import 'package:evite/widgets/event_card.dart';
import 'package:evite/widgets/event_card_2.dart';
import 'package:flutter/material.dart';

class Past extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pastList.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var event = pastList[index];
        return event.date == "Today"
            ? EventCard(
                event: event,
              )
            : EventCard2(event: event);
      },
    );
  }
}
