import 'package:evite/models/event.dart';
import 'package:evite/views/event_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final Event event;
  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetail(event: event),
        ),
      ),
      child: Container(
        width: 180.0,
        padding: EdgeInsets.fromLTRB(15.0, 20, 15, 12),
        margin: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: event.isActive ? theme.primaryColor : theme.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              event.title == "Birthday Breakfast"
                  ? "assets/birthday.svg"
                  : "assets/party.svg",
              width: 25.0,
              color: event.isActive ? Colors.white : theme.primaryColor,
            ),
            Text(
              event.title,
              style: theme.textTheme.headline3?.copyWith(
                color: event.isActive ? Colors.white : null,
              ),
            ),
            SizedBox(
              width: 20.0,
              child: Divider(
                color:event.isActive? Colors.white : theme.primaryColor,
                thickness: 5,
              ),
            ),
            Text(
              DateFormat.MMMMEEEEd().format(event.date),
              style: theme.textTheme.subtitle1?.copyWith(
                color: event.isActive ? Colors.white : null,
              ),
            ),
            // Card(
            //   color:event.isActive ? theme.cardColor.withOpacity(.2) : theme.primaryColor,
            //   elevation: 0.0,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(12.0),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 12.0,
            //       vertical: 4.0,
            //     ),
            //     child: Text(
            //       "GOING",
            //       style: theme.textTheme.bodyText1?.copyWith(
            //         color: event.isActive ? Colors.white : null,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
