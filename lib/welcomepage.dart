import 'package:flutter/material.dart';

const registerInfo = SnackBar(
  content: Text('Rejestrowanie wkrótce'),
);

class WelcomePage extends StatelessWidget {
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
