import 'package:flutter/material.dart';
import 'showdetails.dart';

const registerInfo = SnackBar(
  content: Text('Rejestrowanie wkrótce'),
);

class CustomListItem extends StatelessWidget {
  String cut() {
    String description = eventDescription;
    if (description.length > 50) {
      return description.substring(0, 50) + ' ...';
    }
    return description;
  }

  const CustomListItem({
    Key? key,
    required this.eventAuthor,
    required this.eventName,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventDescription,
    required this.eventImage,
    required this.handleDetails,
  }) : super(key: key);

  final String eventAuthor;
  final String eventName;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String eventDescription;
  final String eventImage;
  final handleDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          handleDetails(eventAuthor, eventName, eventStartDate, eventEndDate,
              eventDescription, eventImage);
        },
        child: Container(
          child: Column(children: [
            Text(eventName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text('Rozpoczęcie: ${eventStartDate}',
                style: TextStyle(fontSize: 18)),
            Text('Zakończenie: ${eventEndDate}',
                style: TextStyle(fontSize: 18)),
            Text(cut()),
          ]),
          margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.teal[100],
            border: Border.all(color: Colors.teal.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class MainPage extends StatefulWidget {
  final enterPage;
  List<Map> eventList;
  String? loggedLogin;
  MainPage(this.enterPage, this.loggedLogin, this.eventList);
  @override
  State<StatefulWidget> createState() {
    return _MainPageState(enterPage, loggedLogin, eventList);
  }
}

class _MainPageState extends State<MainPage> {
  final enterPage;
  List<Map> eventList;
  String? loggedLogin;

  _MainPageState(this.enterPage, this.loggedLogin, this.eventList);

  String? authorToShow;
  String? nameToShow;
  DateTime? startDateToShow;
  DateTime? endDateToShow;
  String? descriptionToShow;
  String? imageToShow;

  void handleDelete(eventName) {
    for (var i = 0; i < eventList.length; i++) {
      if (eventList[i]['Title'] == eventName) {
        eventList.removeAt(i);
        handleGoBack();
      }
    }
  }

  void handleDetails(author, name, startDate, endDate, description, image) {
    setState(() {
      authorToShow = author;
      nameToShow = name;
      startDateToShow = startDate;
      endDateToShow = endDate;
      descriptionToShow = description;
      imageToShow = image;
      enterPage(3);
    });
  }

  void handleGoBack() {
    setState(() {
      authorToShow = null;
      nameToShow = null;
      startDateToShow = null;
      endDateToShow = null;
      descriptionToShow = null;
      imageToShow = null;
      enterPage(0);
    });
  }
  @override
  Widget build(BuildContext context) {
    eventList.sort((m1, m2) {
      var r = m1["StartDate"].compareTo(m2["StartDate"]);
      if (r != 0) return r;
      return m1["EndDate"].compareTo(m2["StartDate"]);
    });
    return authorToShow != null
        ? ShowDetails(authorToShow, nameToShow, startDateToShow, endDateToShow,
            descriptionToShow, imageToShow, handleGoBack, loggedLogin, handleDelete)
        : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemExtent: 106.0,
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              final item = eventList[index];

              return CustomListItem(
                eventAuthor: eventList[index]['Author'],
                eventName: eventList[index]['Title'].toString(),
                eventStartDate: DateTime.parse(eventList[index]['StartDate']),
                eventEndDate: DateTime.parse(eventList[index]['EndDate']),
                eventDescription: eventList[index]['Description'],
                eventImage: eventList[index]['Image'],
                handleDetails: handleDetails,
              );
            },
          );
  }
}
