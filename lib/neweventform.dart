import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class NewEventForm extends StatefulWidget {
  final enterPage;
  final handleAddEvent;
  final eventList;
  final loggedLogin;

  NewEventForm(this.enterPage, this.handleAddEvent, this.eventList, this.loggedLogin);

  @override
  NewEventFormState createState() {
    return NewEventFormState(enterPage, handleAddEvent, eventList, loggedLogin);
  }
}

class TitleInput extends StatelessWidget {
  final titleController;
  final eventList;

  TitleInput(this.titleController, this.eventList);

  bool _doesTitleExist(givenTitile) {
    for (var i = 0; i < eventList.length; i++) {
      if (eventList[i]['Titile'] == givenTitile) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Tytuł:', style: TextStyle(color: Colors.black, fontSize: 20)),
      TextFormField(
        controller: titleController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Dane nie mogą być puste';
          }
          if (_doesTitleExist(value) == false) {
            return 'podany email nie istnieje';
          }
        },
      ),
    ]);
  }
}

class DescriptionInput extends StatelessWidget {
  final descriptionController;
  final eventList;

  DescriptionInput(this.descriptionController, this.eventList);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Opis:', style: TextStyle(color: Colors.black, fontSize: 20)),
      TextFormField(
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
  final eventList;

  StartDateInput(this.handleStartDate, this.eventList);

  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Rozpoczęcie:', style: TextStyle(color: Colors.black, fontSize: 20)),
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
  final eventList;

  EndDateInput(this.handleEndDate, this.eventList);

  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Zakończenie:', style: TextStyle(color: Colors.black, fontSize: 20)),
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

class ImageInput extends StatelessWidget {
  final imageController;
  final eventList;

  ImageInput(this.imageController, this.eventList);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Grafika:', style: TextStyle(color: Colors.black, fontSize: 20)),
      TextFormField(
        controller: imageController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Dane nie mogą być puste';
          }
        },
      ),
    ]);
  }
}

class NewEventFormState extends State<NewEventForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();
  final enterPage;
  final handleAddEvent;
  final eventList;
  final loggedLogin;

  var startDateController;
  var endDateController;

  NewEventFormState(this.enterPage, this.handleAddEvent, this.eventList, this.loggedLogin);

  void handleStartDate(value) {
    startDateController = value;
  }

  void handleEndDate(value) {
    endDateController = value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TitleInput(titleController, eventList),
          DescriptionInput(descriptionController, eventList),
          StartDateInput(handleStartDate, eventList),
          EndDateInput(handleEndDate, eventList),
          ImageInput(imageController, eventList),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {
                  enterPage(0);
                },
                child: Text('Anuluj'),
                style: ElevatedButton.styleFrom(primary: Colors.grey)),
            ElevatedButton(
                // onPressed: () {
                //   print(titleController.text);
                //   print(descriptionController.text);
                //   print(startDateController);
                //   print(endDateController);
                //   enterPage(0);
                // },
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    handleAddEvent(
                        loggedLogin,
                        titleController.text,
                        startDateController.toString(),
                        endDateController.toString(),
                        descriptionController.text,
                        imageController.text);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Dodano Wydarzenie')),
                    );
                    enterPage(0);
                  }
                },
                child: Text('Dodaj Wydarzenie'),
                style: ElevatedButton.styleFrom(primary: Colors.grey)),
          ])
        ]));
  }
}
//------------------------Input Fields-------------------------//