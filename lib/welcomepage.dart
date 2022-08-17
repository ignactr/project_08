import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(image: AssetImage('images/logo.png'), height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Zaloguj')),
            ElevatedButton(onPressed: () {}, child: Text('Rejestruj')),
          ],
        )
      ],
    );
  }
}
