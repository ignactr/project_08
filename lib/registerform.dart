import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class MailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('email:'),
      TextFormField(
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
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('login:'),
      TextFormField(
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
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('hasło:'),
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Uzupełnij dane';
          }
        },
      ),
    ]);
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('Zarejestruj się ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          MailInput(),
          LoginInput(),
          PassInput(),
          ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
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
