import 'dart:ffi';

import 'package:flutter/material.dart';

const registerInfo = SnackBar(
  content: Text('Rejestrowanie wkrótce'),
);

class Event {
  final String eventName;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String eventDescription;

  Event(this.eventName, this.eventStartDate, this.eventEndDate,
      this.eventDescription);
}

class EventDisplay extends StatelessWidget {
  final Event;
  EventDisplay(this.Event);

  String cut() {
    String description = Event.eventDescription;
    if (description.length > 50) {
      return description.substring(0, 50) + ' ...';
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(Event.eventName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        Text('Rozpoczęcie: ${Event.eventStartDate}',
            style: TextStyle(fontSize: 18)),
        Text('Zakończenie: ${Event.eventEndDate}',
            style: TextStyle(fontSize: 18)),
        Text(cut()),
      ]),
      margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  //final DateFormat datePattern = DateFormat('yyyy-MM-dd hh:mm');
  final enterPage;
  MainPage(this.enterPage);

  final List<Event> listOfEvents = [
    Event(
        'Lorem Ipsum',
        DateTime.parse("2022-09-20"),
        DateTime.parse("2022-09-23"),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"),
    Event(
        'Wigilia Charytatywna',
        DateTime.parse("2022-12-24"),
        DateTime.parse("2022-12-24"),
        "Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!"),
    Event(
        'Wigilia Charytatywna',
        DateTime.parse("2022-12-24"),
        DateTime.parse("2022-12-24"),
        "Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!"),
    Event(
        'Wigilia Charytatywna',
        DateTime.parse("2022-12-24"),
        DateTime.parse("2022-12-24"),
        "Świąteczna wigilia dla potrzebujących, bezdomnych i samotnych. Wstęp całkowicie darmowy!"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: <Widget>[
            Image(
              image: AssetImage('images/logo.png'),
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                    message: 'Zaloguj się do serwisu',
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Zaloguj'))),
                ElevatedButton(
                    onPressed: () {
                      enterPage(1);
                    },
                    child: Text('Rejestruj')),
              ],
            ),
          ],
        ),
        EventDisplay(listOfEvents[1]),
        EventDisplay(listOfEvents[2]),
        EventDisplay(listOfEvents[1]),
        EventDisplay(listOfEvents[3]),
        EventDisplay(listOfEvents[0]),
        EventDisplay(listOfEvents[1]),
        EventDisplay(listOfEvents[3]),
        EventDisplay(listOfEvents[0]),
        EventDisplay(listOfEvents[1]),
        EventDisplay(listOfEvents[1]),
        EventDisplay(listOfEvents[3]),
        EventDisplay(listOfEvents[0]),
        EventDisplay(listOfEvents[1]),
        EventDisplay(listOfEvents[1])
      ],
    );
  }
}
