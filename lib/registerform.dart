import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final handleRegister;

  RegisterForm(this.handleRegister);

  @override
  RegisterFormState createState() {
    return RegisterFormState(handleRegister);
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
            return 'Uzupełnij dane';
          }
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
            return 'Uzupełnij dane';
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
            return 'Uzupełnij dane';
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

  RegisterFormState(this.handleRegister);

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
          ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                handleRegister(mailController.text,loginController.text,passController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: Text('Rejestruj'),
          ),
        ],
      ),
    );
  }
}
