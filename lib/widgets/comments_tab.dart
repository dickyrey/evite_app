import 'package:evite/constants.dart';
import 'package:evite/models/event.dart';
import 'package:flutter/material.dart';

class CommentsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: friendList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var friend = friendList[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 27.0,
            backgroundImage: AssetImage(friend.image),
          ),
          title: Text(friend.name, style: kTitleStyle),
          subtitle: Text(
            "I'm so exited!!",
            style: kSubtitleStyle,
          ),
        );
      },
    );
  }
}
