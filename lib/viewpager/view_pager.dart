import 'package:flutter/material.dart';
import 'package:flutter_demo_app/statework/own_text.dart';

class ViewPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ViewPagerState();
}

class ViewPagerState extends State<ViewPager> {
  final _ownWidgetKey = GlobalKey<MyOwnTextState>();

  @override
  Widget build(BuildContext context) {
    MyOwnTextState.message = "Hello world";

    var safeArea = SafeArea(
      child: Center(
        child: Container(
          child: PageView(
            children: [
              Container(
                height: 100,
                color: Colors.green,
                child: MyOwnText(key: _ownWidgetKey),
              ),
              Container(
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      MyOwnTextState.message = "Changed text";
                      _ownWidgetKey.currentState.setState(() {

                      });;
                    },
                    child: Text("Change state"),
                  ),
                ),
              ),
              Container(width: 100, height: 100, color: Colors.red),
            ],
          ),
        ),
      ),
    );
    return safeArea;
  }
}
