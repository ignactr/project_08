import 'package:flutter/material.dart';
import 'registerform.dart';
import 'mainpage.dart';
import 'loginform.dart';

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

  void handleLogin(String mailToLog){
    String? loginToLog;
    for(var i = 0; i < users.length; i++){
      if(users[i]['userMail'] == mailToLog){
        loginToLog = users[i]['userLogin'];
      }
    }
    setState(() {
      loggedMail = mailToLog;
      loggedLogin = loginToLog;
    });
    print(loggedLogin);
    print(loggedMail);
  }

  void handleRegister(String mail, String login, String password) {
    setState(() {
      users.add({'userMail':mail, 'userLogin': login, 'userPass': password});
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

  String? loggedMail;
  String? loggedLogin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55, //set your height
          flexibleSpace: SafeArea(
            child: Container(
              color: Colors.blue,
              child: loggedMail==null ? Row(
                children: [
                  ElevatedButton(
                        onPressed: () {
                          enterPage(2);
                        }, 
                        child: Text('Zaloguj')),
                  ElevatedButton(
                        onPressed: () {
                          enterPage(1);
                        }, 
                        child: Text('Rejestruj')),
                ],
              )
              : Row(
                  children: [
                    Text('zalogowany: $loggedLogin'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          loggedMail = null;
                          loggedLogin = null;
                        });
                      },
                      child: Text('Wyloguj')),
                  ],
                )
            ),
          )
        ),
        body: _pageNumber == 0
            ? MainPage(enterPage)
            : _pageNumber == 1
            ? RegisterForm(enterPage, handleRegister, users)
            : LoginForm(enterPage, handleLogin, users)  
      ),
    );
  }
}