import 'dart:html';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  controller: _controller,
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
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Enter your password'),
                onChanged: (value) => null,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                disabledColor: Colors.grey,
                onPressed: /*isButtonEnable ? () => null :*/ () => null,
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
