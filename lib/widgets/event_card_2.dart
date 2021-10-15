import 'package:evite/constants.dart';
import 'package:evite/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCard2 extends StatelessWidget {
  final Event? event;
  EventCard2({this.event});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 200.0,
      padding: EdgeInsets.fromLTRB(15.0, 20, 15, 12),
      margin: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            event!.title == "Birthday Breakfast"
                ? "assets/birthday.svg"
                : "assets/party.svg",
            width: 25.0,
            color: kOrangeColor,
          ),
          Text(
            event!.title!,
            style: kTitleStyle.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 20.0,
            child: Divider(
              color: kOrangeColor,
              thickness: 5,
            ),
          ),
          Text(
            "${event!.date}\n${event!.time}",
            style: kSubtitleStyle.copyWith(
              color: kOrangeColor,
            ),
          ),
          Card(
            color: kOrangeColor.withOpacity(.2),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
              child: Text(
                "GOING",
                style: kTitleStyle.copyWith(
                  color: kOrangeColor,
                  fontSize: 15.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
