import 'package:evite/common/colors.dart';
import 'package:evite/cubit/theme_cubit.dart';
import 'package:evite/models/event.dart';
import 'package:evite/widgets/event_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            _buildSearchBox(),
            SizedBox(height: 15.0),
            _buildTab(),
            SizedBox(height: 15.0),
            _buildTabBarView(),
            SizedBox(height: 35.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                color: theme.cardColor,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Text("Friends birthday",
                            style: theme.textTheme.headline2),
                        Spacer(),
                        Text(
                          "+ Add new",
                          style: theme.textTheme.subtitle1,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
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
                        title: Text(
                          friend.name,
                          style: theme.textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          "${friend.date} - ${friend.age} Birthday",
                          style: theme.textTheme.subtitle1,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThemeCubit>().changeTheme();
        },
        backgroundColor: theme.primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Container _buildTabBarView() {
    return Container(
      width: double.infinity,
      height: 150.0,
      margin: EdgeInsets.only(left: 18.0),
      child: TabBarView(
        controller: _controller,
        children: [
          EventTabBarView(events: upcommingList),
          EventTabBarView(events: pastList),
        ],
      ),
    );
  }

  Align _buildTab() {
    final theme = Theme.of(context);
    final state = context.read<ThemeCubit>().state;
    return Align(
      alignment: Alignment.topLeft,
      child: TabBar(
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
          Tab(text: "Upcomming"),
          Tab(text: "Past"),
        ],
      ),
    );
  }

  Container _buildSearchBox() {
    final theme = Theme.of(context);
    final state = context.read<ThemeCubit>().state;
    return Container(
      width: double.infinity,
      height: 55.0,
      margin: EdgeInsets.symmetric(horizontal: 18.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: state is ThemeDark
                ? ColorDark.background
                : theme.primaryColor.withOpacity(.2),
            blurRadius: 7.0,
            spreadRadius: 1,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: TextField(
        cursorColor: theme.primaryColor,
        decoration: InputDecoration(
          icon: SvgPicture.asset(
            "assets/search.svg",
            width: 25.0,
            color: theme.primaryColor,
          ),
          border: InputBorder.none,
          hintText: "Search events",
          hintStyle: theme.textTheme.subtitle1,
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    final theme = Theme.of(context);
    return PreferredSize(
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
                color: theme.primaryColor,
              )
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(70.0),
    );
  }
}
