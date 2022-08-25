import 'package:flutter/material.dart';

class NewEventForm extends StatefulWidget {
  final enterPage;

  NewEventForm(this.enterPage);

  @override
  NewEventFormState createState() {
    return NewEventFormState(enterPage);
  }
}

class NewEventFormState extends State<NewEventForm> {
  final _formKey = GlobalKey<FormState>();
  final enterPage;

  NewEventFormState(this.enterPage);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {
                  enterPage(0);
                },
                child: Text('Anuluj'),
                style: ElevatedButton.styleFrom(primary: Colors.grey )),
          ])
        ]
    ));
  }
}