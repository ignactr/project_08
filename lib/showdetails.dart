import 'package:flutter/material.dart';

class ShowDetails extends StatelessWidget {
  final author;
  final name;
  final startDate;
  final endDate;
  final description;

  ShowDetails(this.author, this.name, this.startDate, this.endDate, this.description);

  @override
  Widget build(BuildContext context) {
    return Text('Working on it');
  }
}