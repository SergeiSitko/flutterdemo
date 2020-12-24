import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_data.dart';



class StateView extends StatelessWidget {
  int age;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Consumer<UserStorage>(
              builder: (BuildContext context, userStorage, Widget child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(onPressed: () => userStorage.addUser(User("Nick", 10)), child: Text("Increment", style: TextStyle(fontSize: 20))),
                  SizedBox(height: 30),
                  RaisedButton(onPressed: () => userStorage.clearAll(), child: Text("Clear all", style: TextStyle(fontSize: 20))),
                  SizedBox(height: 30),
                  RaisedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StateSecondView())),
                      child: Text("Move to Another screen", style: TextStyle(fontSize: 20))),
                  SizedBox(height: 30),
                  Align(alignment: Alignment.center, child: Text("${userStorage.users.length}", style: TextStyle(fontSize: 20)))
                ],
              ),
            ),
          ),
        ),
      );
}

class StateSecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider.value(
          value: UserStorage.getStorage(),
          child: SafeArea(
            child: Center(
              child: Consumer<UserStorage>(
                builder: (BuildContext context, userStorage, Widget child) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(onPressed: () => userStorage.removeLast(), child: Text("Remove Last", style: TextStyle(fontSize: 20))),
                    SizedBox(height: 30),
                    Align(alignment: Alignment.center, child: Text("${userStorage.users.length}", style: TextStyle(fontSize: 20)))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
