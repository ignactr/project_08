import 'package:flutter/material.dart';

const registerInfo = SnackBar(
  content: Text('Rejestrowanie wkrótce'),
);

class Event{
  final String eventName;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String eventDescription;

  Event(this.eventName,this.eventStartDate,this.eventEndDate,this.eventDescription);
}

class MainPage extends StatelessWidget {
  //final DateFormat datePattern = DateFormat('yyyy-MM-dd hh:mm');
  final List<Event> listOfEvents = [
    Event('Lorem Ipsum', DateTime.parse("2022-09-20 8:45"),DateTime.parse("2022-09-23 23:59"),"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(image: AssetImage('images/logo.png'), height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tooltip(
              message: 'Zaloguj się do serwisu',
              child: ElevatedButton(onPressed: () {}, child: Text('Zaloguj'))
              ),
            ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(registerInfo);
            }, child: Text('Rejestruj')),
          ],
        )
      ],
    );
  }
}
