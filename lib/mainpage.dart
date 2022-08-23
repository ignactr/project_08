import 'dart:ffi';

import 'package:flutter/material.dart';

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
    required this.eventName,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventDescription,
  }) : super(key: key);

  final String eventName;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String eventDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(eventName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        Text('Rozpoczęcie: ${eventStartDate}', style: TextStyle(fontSize: 18)),
        Text('Zakończenie: ${eventEndDate}', style: TextStyle(fontSize: 18)),
        Text(cut()),
      ]),
      margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  //final DateFormat datePattern = DateFormat('yyyy-MM-dd hh:mm');
  final enterPage;
  MainPage(this.enterPage);

  final List<Map<String, String>> eventList = [
    {
      'Title': 'Lorem Ipsum',
      'StartDate': '2022-09-20',
      'EndDate': '2022-09-23',
      'Description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
      'Image': 'images/grafika.png'
    },
    {
      'Title': 'Lorem Ipsum',
      'StartDate': '2022-09-20',
      'EndDate': '2022-09-23',
      'Description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
      'Image': 'images/grafika.png'
    },
    {
      'Title': 'Lorem Ipsum',
      'StartDate': '2022-09-20',
      'EndDate': '2022-09-23',
      'Description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
      'Image': 'images/grafika.png'
    },
    {
      'Title': 'Wigilia Charytatywna',
      'StartDate': '2022-12-24',
      'EndDate': '2022-12-24',
      'Description':
          'Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!',
      'Image': 'images/wigilia.png'
    },
    {
      'Title': 'Wigilia Charytatywna',
      'StartDate': '2022-12-24 15:30',
      'EndDate': '2022-12-24 20:00',
      'Description':
          'Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!',
      'Image': 'images/wigilia.png'
    },
    {
      'Title': 'Wigilia Charytatywna',
      'StartDate': '2022-12-24 15:30',
      'EndDate': '2022-12-24 20:00',
      'Description':
          'Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!',
      'Image': 'images/wigilia.png'
    },
    {
      'Title': 'Wigilia Charytatywna',
      'StartDate': '2022-12-24 15:30',
      'EndDate': '2022-12-24 20:00',
      'Description':
          'Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!',
      'Image': 'images/wigilia.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      itemCount: eventList.length,
      itemBuilder: (context, index) {
        final item = eventList[index];

        return CustomListItem(
          eventName: eventList[index]['Title'].toString(),
          eventStartDate:
              DateTime.parse(eventList[index]['StartDate'].toString()),
          eventEndDate: DateTime.parse(eventList[index]['EndDate'].toString()),
          eventDescription: eventList[index]['Description'].toString(),
        );
      },
    );
  }
}
