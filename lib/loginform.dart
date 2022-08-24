import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

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
  final users;

  MailInput(this.mailController, this.users);

  bool _doesMailExist(givenMail){
    for(var i = 0; i < users.length; i++){
      if(users[i]['userMail'] == givenMail){
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('email:',style: TextStyle(color: Colors.black, fontSize: 20)),
      TextFormField(
        controller: mailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Dane nie mogą być puste';
          }
          if(_doesMailExist(value) == false){
            return 'podany email nie istnieje';
          }
        },
      ),
    ]);
  }
}

class PassInput extends StatelessWidget {
  final passController;
  final passValidation;
  final mail;

  PassInput(this.passController, this.passValidation, this.mail);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('hasło:',style: TextStyle(color: Colors.black, fontSize: 20)),
      TextFormField(
        obscureText: true,
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

  bool passValidation(String mail,String password){
    var pass = utf8.encode(password);
    var passHash = sha1.convert(pass).toString();
    if(mail == null){
      return false;
    }
    for(var i = 0; i < users.length; i++){
      if(users[i]['userMail'] == mail){
        if(users[i]['userPass'] == passHash){
          return true;
        }
        return false;
      } 
    }
    return false;
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          MailInput(mailController, users),
          PassInput(passController, passValidation, mailController.text),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {
                  enterPage(0);
                },
                child: Text('Anuluj'),
                style: ElevatedButton.styleFrom(primary: Colors.grey )),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if(passValidation(mailController.text, passController.text)){
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Zalogowano!')));
                    handleLogin(mailController.text);
                    enterPage(0);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Błędne hasło!'), backgroundColor: Colors.red,));
                  }
                }
              }
            ,
              child: Text('Zaloguj'),
              style: ElevatedButton.styleFrom(primary: Colors.grey )),
          ])
        ]
    ));
  }
}