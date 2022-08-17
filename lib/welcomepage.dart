import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: [
          ElevatedButton(onPressed: () {}, child: Text('Zaloguj')),
          ElevatedButton(onPressed: () {}, child: Text('Rejestruj')),
        ],)
      ],
    );
  }
}
