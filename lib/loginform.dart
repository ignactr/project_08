import 'package:flutter/material.dart';
import 'dart:convert';

class LoginForm extends StatefulWidget {
  final enterPage;
  final handleLogin;
  final users;

  LoginForm(this.enterPage, this.handleLogin, this.users);

  @override
  LoginFormState createState() {
    return LoginFormState(enterPage,handleLogin,users);
  }
}

class MailInput extends StatelessWidget {
  final mailController;

  MailInput(this.mailController);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('email:'),
      TextFormField(
        controller: mailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Dane nie mogą być puste';
          }
        },
      ),
    ]);
  }
}

class PassInput extends StatelessWidget {
  final passController;

  PassInput(this.passController);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('hasło:'),
      TextFormField(
        controller: passController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Dane nie mogą być puste';
          }
        },
      ),
    ]);
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final enterPage;
  final handleLogin;
  final users;

  LoginFormState(this.enterPage,this.handleLogin,this.users);
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const Text('Zaloguj się ',style: TextStyle(fontWeight: FontWeight.bold)),
          MailInput(mailController),
          PassInput(passController),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {
                  enterPage(0);
                },
                child: Text('Anuluj')),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Przetwarzanie danych')),
                  );
                  enterPage(0);
                }
              }
            ,
              child: Text('Zaloguj'),
            ),
          ])
        ]
    ));
  }
}