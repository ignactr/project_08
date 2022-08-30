import 'package:flutter/material.dart';

class ShowDetails extends StatelessWidget {
  final author;
  final name;
  final startDate;
  final endDate;
  final description;
  final image;
  final handleGoBack;
  final loggedLogin;
  final handleDelete;
  

  ShowDetails(this.author, this.name, this.startDate, this.endDate,
      this.description, this.image, this.handleGoBack, this.loggedLogin, this.handleDelete);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Column(
              children: [
                Row(children: [
                  Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600)),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          image,
                          width: 80,
                        ),
                      )
                    ],
                  ),
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                Text('Opis:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold)),
                Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 23)),
                Row(children: [
                  Text('Rozpoczęcie: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text(startDate.toString().substring(0, 16),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ], mainAxisAlignment: MainAxisAlignment.center),
                Row(children: [
                  Text('Zakończenie: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text(endDate.toString().substring(0, 16),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ], mainAxisAlignment: MainAxisAlignment.center),
                Row(children: [
                  Text('Autor: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text(author,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ], mainAxisAlignment: MainAxisAlignment.center),
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
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.teal[100],
          border: Border.all(color: Colors.teal.shade100),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
