import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.add), text: "Add"),
            Tab(icon: Icon(Icons.minimize_rounded), text: "Remove"),
            Tab(icon: Icon(Icons.equalizer), text: "Equal"),
          ]),
        ),
        body: TabBarView(children: [
          FirstScreen(),
          SecondScreeen(),
          ThirdScreen(),
        ]),
      ),
    );
  }

  Future<String> _buildWork() => Future.delayed(Duration(seconds: 3), () => "Data").then(
        (value) => Future.delayed(Duration(seconds: 1), () => "Old Data $value with new BLA BLA"),
      );
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("ThirdScreen");
    return Center(child: RaisedButton(onPressed: () => null, child: Text("Third")));
  }
}

class SecondScreeen extends StatelessWidget {
  const SecondScreeen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("SecondScreeen");
    return Center(child: RaisedButton(onPressed: () => null, child: Text("Second")));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("FirstScreen");
    return Center(child: RaisedButton(onPressed: () => null, child: Text("First")));
  }
}

class CustomTextFeald extends StatelessWidget {
  const CustomTextFeald({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        minLines: 2,
        maxLines: 6,
        decoration: InputDecoration(
          hintText: "Type some words",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        autofillHints: ["hello", "no no", "schet"],
      ),
    );
  }
}
