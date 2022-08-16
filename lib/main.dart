import 'package:flutter/material.dart';
import 'registerform.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
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
        body: RegisterForm(handleRegister),
      ),
    );
  }
}
