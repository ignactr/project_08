import 'package:flutter/material.dart';

class ShowDetails extends StatelessWidget {
  final author;
  final name;
  final startDate;
  final endDate;
  final description;
  final handleGoBack;
  final loggedLogin;
  final handleDelete;

  ShowDetails(this.author, this.name, this.startDate, this.endDate,
      this.description, this.handleGoBack, this.loggedLogin, this.handleDelete);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Column(
              children: [
                Text('Nazwa: $name',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25)),
                Text('Opis: $description',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                Text('Rozpoczęcie: $startDate',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25)),
                Text('Zakończenie: $endDate',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25)),
                Text('Autor: $author',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              ],
            )),
            Positioned(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: author == loggedLogin
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              ElevatedButton(
                                  onPressed: () {
                                    handleGoBack();
                                  },
                                  child: Text('Powrót do menu'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.grey)),
                              ElevatedButton(
                                  onPressed: () {
                                    handleDelete(name);
                                  },
                                  child: Text('Usuń wydarzenie'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red)),
                            ])
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              ElevatedButton(
                                  onPressed: () {
                                    handleGoBack();
                                  },
                                  child: Text('Powrót do menu'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.grey)),
                            ])),
            )
          ],
        ),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.teal[100],
          border: Border.all(color: Colors.teal.shade100),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
