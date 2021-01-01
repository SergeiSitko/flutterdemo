import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class InputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var defaultTabController = DefaultTabController(
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
          SecondScreen(),
          ThirdScreen(),
        ]),
      ),
    );

    return defaultTabController;
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("First");
    return Center(
      child: PlatformButton(
        color: Colors.red,
        onPressed: () => showPlatformDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => PlatformAlertDialog(
            title: Text("Alert"),
            content: Text("It's simple content"),
            actions: [
              PlatformDialogAction(
                  child: Text("ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              PlatformDialogAction(
                  child: Text("no"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
        child: Text("First"),
      ),
    );
  }
}


class ThirdScreen extends StatelessWidget {
  const ThirdScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Third");
    return Center(
      child: RaisedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Third"),
            actions: [Text("Yes"), Text("No")],
            content: Text("Content"),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Second");
    return Center(child: RaisedButton(onPressed: () => null, child: Text("Second")));
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
