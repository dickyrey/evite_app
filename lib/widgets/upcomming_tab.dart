import 'package:evite/models/event.dart';
import 'package:evite/views/event_detail.dart';
import 'package:evite/widgets/event_card.dart';
import 'package:evite/widgets/event_card_2.dart';
import 'package:flutter/material.dart';

class UpComming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: upcommingList.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var event = upcommingList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventDetail(event: event),
              ),
            );
          },
          child: event.date == "Today"
              ? EventCard(
                  event: event,
                )
              : EventCard2(event: event),
        );
      },
    );
  }
}
