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
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

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
      Text('Rozpoczęcie'),
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
            return DateTimeField.combine(date, time);
          } else {
            print(currentValue.toString());
            handleStartDate(currentValue.toString());
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
      Text('Zakończenie'),
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
            return DateTimeField.combine(date, time);
          } else {
            print(currentValue.toString());
            handleEndDate(currentValue.toString());
          }
        },
      ),
    ]);
  }
}