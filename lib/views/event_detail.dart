import 'package:evite/constants.dart';
import 'package:evite/models/event.dart';
import 'package:evite/widgets/comments_tab.dart';
import 'package:evite/widgets/event_detail_tab.dart';
import 'package:evite/widgets/guest_list_tab.dart';
import 'package:flutter/material.dart';

class EventDetail extends StatefulWidget {
  final Event? event;
  EventDetail({this.event});

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 35.0, right: 18.0),
                alignment: Alignment.topRight,
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.event!.image!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                height: 50.0,
                child: Row(
                  children: [
                    Text(widget.event!.date!, style: kOrangeTextStyle),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: Divider(
                        color: kOrangeColor,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Text(widget.event!.time!, style: kOrangeTextStyle),
                  ],
                ),
              ),
              Container(
                width: 100.0,
                margin: EdgeInsets.only(left: 18.0),
                child: Text(widget.event!.title!, style: kTitleStyle),
              ),
              SizedBox(height: 15.0),
              TabBar(
                controller: _controller,
                labelStyle: kSelectedStyle,
                unselectedLabelStyle: kUnselectedStyle,
                isScrollable: true,
                indicatorColor: kOrangeColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Event details"),
                  Tab(text: "Guest list"),
                  Tab(text: "Comment"),
                ],
              ),
              SizedBox(
                height: 400.0,
                child: TabBarView(
                  controller: _controller,
                  physics: ScrollPhysics(),
                  children: [
                    EventDetailTab(),
                    GuestListTab(),
                    CommentsTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
