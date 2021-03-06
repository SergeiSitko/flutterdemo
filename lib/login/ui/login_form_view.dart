import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/login/bloc/loginform/login_event.dart';

import '../bloc/loginform/login_bloc.dart';

class LoginFormView extends StatelessWidget {
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

                  // Fluttertoast.showToast(
                  //     msg: "mail: $email, password: $password", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1);

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
