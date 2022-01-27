import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final String title;
  final DateTime date;
  final String time;
  final String image;
  final bool isActive;
  Event({
    required this.time,
    required this.date,
    required this.title,
    required this.image,
    required this.isActive,
  });

  @override
  List<Object> get props => [
        title,
        date,
        time,
        image,
        isActive,
      ];
}

class Friend extends Equatable {
  final String name;
  final String date;
  final String age;
  final String image;
  Friend({
    required this.age,
    required this.date,
    required this.image,
    required this.name,
  });

  @override
  List<Object> get props => [
        name,
        date,
        age,
        image,
      ];
}

List<Friend> friendList = [
  Friend(
    name: "Jessica Veranda",
    date: "20 June",
    age: "25th",
    image: "assets/5.jpg",
  ),
  Friend(
    name: "Nabilah Ratna Ayu",
    date: "23 June",
    age: "20th",
    image: "assets/1.jpg",
  ),
  Friend(
    name: "Melody Nurramdhani Laksani",
    date: "15 July",
    age: "31th",
    image: "assets/2.jpg",
  ),
  Friend(
    name: "Cindy Yuvia",
    date: "27 July",
    age: "23th",
    image: "assets/3.jpg",
  ),
  Friend(
    name: "Cindy Gulla",
    date: "17 August",
    age: "23th",
    image: "assets/4.jpg",
  ),
];

List<Event> upcommingList = [
  Event(
    title: "Birthday Breakfast",
    date: DateTime(12, 1, 2019),
    time: "10:30 - 14:00",
    image: "assets/6.jpg",
    isActive: true,
  ),
  Event(
    title: "Company Party",
    date: DateTime(25, 12, 2019),
    time: "08:00 - 10:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
  Event(
    title: "Wedding Party",
    date: DateTime(10, 01, 2020),
    time: "15:30 - 20:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
  Event(
    title: "4th Anniversary",
    date: DateTime(25, 01, 2020),
    time: "00:00 - 01:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
  Event(
    title: "Jhon Birthday",
    date: DateTime(10, 02, 2020),
    time: "10:00 - 01:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
];
List<Event> pastList = [
  Event(
    title: "Moury Birthday",
    date: DateTime(02, 03, 2020),
    time: "10:00 - 01:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
  Event(
    title: "1st Anniversary",
    date: DateTime(05, 03, 2020),
    time: "00:00 - 01:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
  Event(
    title: "Company Party",
    date: DateTime(15, 03, 2020),
    time: "08:00 - 10:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
  Event(
    title: "Wedding Party",
    date: DateTime(22, 04, 2020),
    time: "15:30 - 20:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
  Event(
    title: "Birthday Breakfast",
    date: DateTime(05, 06, 2020),
    time: "10:30 - 14:00",
    image: "assets/6.jpg",
    isActive: false,
  ),
];
