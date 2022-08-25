import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

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

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var startDateController;
  var endDateController;

  NewEventFormState(this.enterPage);

  void handleStartDate(value){
    startDateController = value;
  }
  void handleEndDate(value){
    endDateController = value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TitleInput(titleController),
          DescriptionInput(descriptionController),
          StartDateInput(handleStartDate),
          EndDateInput(handleEndDate),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {
                  enterPage(0);
                },
                child: Text('Anuluj'),
                style: ElevatedButton.styleFrom(primary: Colors.grey )),
            ElevatedButton(
                onPressed: () {
                  print(titleController.text);
                  print(descriptionController.text);
                  print(startDateController);
                  print(endDateController);
                  enterPage(0);
                },
                child: Text('Dodaj Wydarzenie'),
                style: ElevatedButton.styleFrom(primary: Colors.grey )),
          ])
        ]
    ));
  }
}
//------------------------Input Fields-------------------------//

class TitleInput extends StatelessWidget {
  final titleController;

  TitleInput(this.titleController);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Tytuł:',style: TextStyle(color: Colors.black, fontSize: 20)),
      TextFormField(
        obscureText: true,
        controller: titleController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Dane nie mogą być puste';
          }
        },
      ),
    ]);
  }
}
class DescriptionInput extends StatelessWidget {
  final descriptionController;

  DescriptionInput(this.descriptionController);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Opis:',style: TextStyle(color: Colors.black, fontSize: 20)),
      TextFormField(
        obscureText: true,
        controller: descriptionController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Dane nie mogą być puste';
          }
        },
      ),
    ]);
  }
}
class StartDateInput extends StatelessWidget {
  final handleStartDate;

  StartDateInput(this.handleStartDate);

  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Rozpoczęcie:',style: TextStyle(color: Colors.black, fontSize: 20)),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            handleStartDate(DateTimeField.combine(date, time));
            return DateTimeField.combine(date, time);
          } else {
            handleStartDate(currentValue.toString());
            return currentValue;
          }
        },
      ),
    ]);
  }
}
class EndDateInput extends StatelessWidget {
  final handleEndDate;

  EndDateInput(this.handleEndDate);

  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Zakończenie:',style: TextStyle(color: Colors.black, fontSize: 20)),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            handleEndDate(DateTimeField.combine(date, time));
            return DateTimeField.combine(date, time);
          } else {
            handleEndDate(currentValue.toString());
            return currentValue;
          }
        },
      ),
    ]);
  }
}