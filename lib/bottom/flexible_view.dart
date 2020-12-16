import 'package:flutter/material.dart';

class FlexibleView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    var myState = MyState();
    return myState;
  }
}

class MyState extends State<FlexibleView> {
  @override
  Widget build(BuildContext context) {
    var flexible = Flexible(
      child: Container(
        decoration: BoxDecoration(color: Colors.green[100], border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("FlexibleView", style: TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ),
    );
    return flexible;
  }

  @override
  void initState() {}
}
