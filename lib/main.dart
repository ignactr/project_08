import 'package:flutter/material.dart';
import 'registerform.dart';
import 'mainpage.dart';
import 'loginform.dart';
import 'neweventform.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _pageNumber = 0;
  void enterPage(int pageNumber) {
    setState(() {
      _pageNumber = pageNumber;
    });
  }

  void handleLogin(String mailToLog) {
    String? loginToLog;
    for (var i = 0; i < users.length; i++) {
      if (users[i]['userMail'] == mailToLog) {
        loginToLog = users[i]['userLogin'];
      }
    }
    setState(() {
      loggedLogin = loginToLog;
    });
  }

  void handleRegister(String mail, String login, String password) {
    setState(() {
      users.add({'userMail': mail, 'userLogin': login, 'userPass': password});
    });
  }

  var users = [
    {
      'userMail': 'ignacy.trocki@wp.pl',
      'userLogin': 'ignactr',
      'userPass': '01b307acba4f54f55aafc33bb06bbbf6ca803e9a'
    }, //pass: 1234567890
    {
      'userMail': 'sebastian.zubrycki@gmail.com',
      'userLogin': 'SebastianZ',
      'userPass': '8104ba1dc0409b259f487ed07db477c38f205a30'
    }, //pass: 0000000000
    {
      'userMail': 'dudini.garibaldi@gmail.com',
      'userLogin': 'Arczin',
      'userPass': 'c1602d2c7d8cd8a7450246e4d214ad6a1ecf5259'
    }, //pass: dudek1234
    {
      'userMail': 'naaajak.git@git.com',
      'userLogin': 'FekalnyYeti',
      'userPass': 'fd576197b0bc322593923292327784d832221e44'
    }, //pass: mlecznygolem
  ];

  String? loggedLogin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              toolbarHeight: 55, //set your height
              flexibleSpace: SafeArea(
                child: Container(
                    color: Colors.black,
                    child: _pageNumber == 1
                        ? Text('Zarejestruj się',
                            style: TextStyle(color: Colors.white, fontSize: 30))
                        : _pageNumber == 2
                            ? Text('Zaloguj się',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))
                            : _pageNumber == 3
                                ? Text('Szczegóły wydarzenia',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30))
                                : loggedLogin == null
                                    ? Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                enterPage(2);
                                              },
                                              child: Text('Zaloguj'),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.grey)),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                              onPressed: () {
                                                enterPage(1);
                                              },
                                              child: Text('Rejestruj'),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.grey)),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Text('$loggedLogin',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  loggedLogin = null;
                                                });
                                              },
                                              child: Text('Wyloguj',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.grey)),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                              onPressed: () {
                                                enterPage(4);
                                              },
                                              child: Text('Dodaj Wydarzenie',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.grey)),
                                        ],
                                      )),
              )),
          body: (_pageNumber == 0 || _pageNumber == 3)
              ? MainPage(enterPage, loggedLogin)
              : _pageNumber == 1
                  ? RegisterForm(enterPage, handleRegister, users)
                  : _pageNumber == 2 ? LoginForm(enterPage, handleLogin, users)
                  : NewEventForm(enterPage))
    );
  }
}
