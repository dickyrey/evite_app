import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetailTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.0),
          ListTile(
            leading: CircleAvatar(
              radius: 26.0,
              backgroundImage: AssetImage("assets/5.jpg"),
            ),
            title: Text("Jessica Veranda", style: theme.textTheme.bodyText1),
            subtitle: Text("Host", style: theme.textTheme.subtitle1),
          ),
          Divider(color: theme.primaryColor),
          ListTile(
            leading: SvgPicture.asset(
              "assets/location.svg",
              width: 25.0,
              color: theme.primaryColor,
            ),
            title: Text(
              "48 Cambridge Street CLARENDON 2756 New South Wales",
              style: theme.textTheme.subtitle2,
            ),
          ),
          Divider(color: theme.primaryColor),
          ListTile(
            leading: SvgPicture.asset(
              "assets/menu.svg",
              width: 25.0,
              color: theme.primaryColor,
            ),
            title: Text(
              "Snaks a buffet and drinks will be provided",
              style: theme.textTheme.subtitle1,
            ),
          ),
          Divider(color: theme.primaryColor),
          ListTile(
            leading: SvgPicture.asset(
              "assets/gift.svg",
              width: 25.0,
              color: theme.primaryColor,
            ),
            title: Text(
              "No presents, just your presence",
              style: theme.textTheme.subtitle1,
            ),
          ),
          Divider(color: theme.primaryColor),
        ],
      ),
    );
  }
}
