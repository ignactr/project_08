import 'package:flutter/material.dart';
import 'registerform.dart';
import 'mainpage.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _pageNumber = 0;
  void enterPage(int pageNumber){
    setState((){
      _pageNumber = pageNumber;
    });
  }
  void handleRegister(String mail, String login, String password){
    print(mail);
    print(login);
    print(password);
  }
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('New App'),
        ),
        body: _pageNumber == 0 ? MainPage(enterPage) : RegisterForm(handleRegister) ,
      ),
    );
  }
}
