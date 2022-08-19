import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class RegisterForm extends StatefulWidget {
  final handleRegister;
  final enterPage;

  RegisterForm(this.enterPage, this.handleRegister);

  @override
  RegisterFormState createState() {
    return RegisterFormState(enterPage, handleRegister);
  }
}

//-------------------------------------------------------------------------
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
          } else if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return 'Wprowadź poprawny adres E-mail';
          }
          ;
        },
      ),
    ]);
  }
}

class LoginInput extends StatelessWidget {
  final loginController;

  LoginInput(this.loginController);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('login:'),
      TextFormField(
        controller: loginController,
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
        obscureText: true,
        controller: passController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Dane nie mogą być puste';
          } else if (value.length < 8) {
            return 'Długość hasła to minimum 8 znaków';
          } else if (value.length > 30) {
            return 'Długość hasła to maksymalnie 30 znaków';
          }
        },
      ),
    ]);
  }
}
//-------------------------------------------------------------------------

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final loginController = TextEditingController();
  final passController = TextEditingController();
  final handleRegister;
  final enterPage;

  RegisterFormState(this.enterPage, this.handleRegister);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('Zarejestruj się ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          MailInput(mailController),
          LoginInput(loginController),
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
                  var pass = utf8.encode(passController.text);
                  var passHash = sha1.convert(pass);
                  handleRegister(mailController.text, loginController.text,
                      passHash.toString());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  enterPage(0);
                }
              },
              child: Text('Rejestruj'),
            ),
          ]),
        ],
      ),
    );
  }
}
