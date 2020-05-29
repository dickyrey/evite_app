class Event {
  final String title;
  final String date;
  final String time;
  final String image;
  Event({
    this.time,
    this.date,
    this.title,
    this.image,
  });
}

class Friend {
  final String name;
  final String date;
  final String age;
  final String image;
  Friend({this.age, this.date, this.image, this.name});
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
      date: "Today",
      time: "10:30 - 14:00",
      image: "assets/6.jpg"),
  Event(
      title: "Company Party",
      date: "1/06/2020",
      time: "08:00 - 10:00",
      image: "assets/6.jpg"),
  Event(
      title: "Wedding Party",
      date: "10/06/2020",
      time: "15:30 - 20:00",
      image: "assets/6.jpg"),
  Event(
      title: "4th Anniversary",
      date: "25/06/2020",
      time: "00:00 - 01:00",
      image: "assets/6.jpg"),
  Event(
      title: "Jhon Birthday",
      date: "10/07/2020",
      time: "10:00 - 01:00",
      image: "assets/6.jpg"),
];
List<Event> pastList = [
  Event(
      title: "Moury Birthday",
      date: "02/03/2020",
      time: "10:00 - 01:00",
      image: "assets/6.jpg"),
  Event(
      title: "1st Anniversary",
      date: "05/03/2020",
      time: "00:00 - 01:00",
      image: "assets/6.jpg"),
  Event(
      title: "Company Party",
      date: "15/03/2020",
      time: "08:00 - 10:00",
      image: "assets/6.jpg"),
  Event(
      title: "Wedding Party",
      date: "22/04/2020",
      time: "15:30 - 20:00",
      image: "assets/6.jpg"),
  Event(
      title: "Birthday Breakfast",
      date: "30/04/2020",
      time: "10:30 - 14:00",
      image: "assets/6.jpg"),
];
