import 'package:evite/constants.dart';
import 'package:evite/models/event.dart';
import 'package:evite/widgets/event_card.dart';
import 'package:evite/widgets/event_card_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrangeAccent,
      appBar: PreferredSize(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 20.0,
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 120.0,
                  height: 60,
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/gift.svg",
                  width: 25.0,
                  color: kOrangeColor,
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(70.0),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25.0),
              Container(
                width: double.infinity,
                height: 55.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: kOrangeColor.withOpacity(.2),
                      blurRadius: 7.0,
                      spreadRadius: 1,
                      offset: Offset(2, 4),
                    )
                  ],
                ),
                child: TextField(
                  cursorColor: kOrangeColor,
                  decoration: InputDecoration(
                    icon: SvgPicture.asset(
                      "assets/search.svg",
                      width: 25.0,
                      color: kOrangeColor,
                    ),
                    border: InputBorder.none,
                    hintText: "Search events",
                    hintStyle: kHintStyle,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  controller: _controller,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: kSelectedStyle,
                  unselectedLabelStyle: kUnselectedStyle,
                  isScrollable: true,
                  indicatorColor: kOrangeColor,
                  tabs: [
                    Tab(text: "Upcomming"),
                    Tab(text: "Past"),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: double.infinity,
                height: 250.0,
                margin: EdgeInsets.only(left: 18.0),
                child: TabBarView(
                  controller: _controller,
                  children: [
                    UpComming(),
                    Past(),
                  ],
                ),
              ),
              SizedBox(height: 35.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text("Friends birthday", style: kTitleStyle),
                          Spacer(),
                          Text(
                            "+ Add new",
                            style: kSubtitleStyle.copyWith(
                              color: kOrangeColor,
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
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
                            "${friend.date} - ${friend.age} Birthday",
                            style: kSubtitleStyle,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kOrangeColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

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
        return event.date == "Today"
            ? EventCard(
                event: event,
              )
            : EventCard2(event: event);
      },
    );
  }
}

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
