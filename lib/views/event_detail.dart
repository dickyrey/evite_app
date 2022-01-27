import 'package:evite/common/colors.dart';
import 'package:evite/cubit/theme_cubit.dart';
import 'package:evite/models/event.dart';
import 'package:evite/widgets/comments_tab.dart';
import 'package:evite/widgets/event_detail_tab.dart';
import 'package:evite/widgets/guest_list_tab.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetail extends StatefulWidget {
  final Event event;
  EventDetail({required this.event});

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
    final theme = Theme.of(context);
    final state = context.read<ThemeCubit>().state;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 35.0, right: 18.0),
                    alignment: Alignment.topRight,
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.event.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black38,
                    ),
                  ),
                  Positioned(
                    left: 18,
                    top: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: 50.0,
              child: Row(
                children: [
                  Text(DateFormat.yMMMEd().format(widget.event.date),
                      style: theme.textTheme.bodyText2),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: Divider(
                      color: theme.primaryColor,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Text(widget.event.time, style: theme.textTheme.bodyText2),
                ],
              ),
            ),
            Container(
              width: 100.0,
              margin: EdgeInsets.only(left: 18.0),
              child: Text(
                widget.event.title,
                style: theme.textTheme.headline2,
              ),
            ),
            SizedBox(height: 15.0),
            TabBar(
              controller: _controller,
              labelStyle: theme.textTheme.headline4,
              unselectedLabelStyle: theme.textTheme.subtitle1,
              isScrollable: true,
              indicatorColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: theme.primaryColor,
              unselectedLabelColor: state is ThemeDark
                  ? ColorDark.fontSubtitle
                  : ColorLight.fontSubtitle,
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
    );
  }
}
