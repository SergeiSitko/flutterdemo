import 'package:flutter/material.dart';

class MyOwnText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyOwnTextState();

  MyOwnText({Key key}) : super(key: key);
}

class MyOwnTextState extends State<MyOwnText> {
  static String message;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(message, style: TextStyle(fontSize: 20)),
          ),
        ),
      );
}
