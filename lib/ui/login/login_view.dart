import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginbloc/login_bloc.dart';
import 'loginbloc/login_event.dart';

class LoginView extends StatelessWidget {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = context.bloc<LoginBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(16),
                child: TextFormField(
                  controller: loginController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(icon: Icon(Icons.email, color: Colors.pink), labelText: 'Enter your loign'),
                  onChanged: (value) => null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Enter your password'),
                onChanged: (value) => null,
              ),
            ),
            Container(
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                disabledColor: Colors.grey,
                onPressed: () {
                  var email = loginController.text;
                  var password = passwordController.text;

                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("mail: $email, password: $password")));

                  var loginButtonPressed = LoginButtonPressed(email, password);
                  return loginBloc.add(loginButtonPressed);
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
