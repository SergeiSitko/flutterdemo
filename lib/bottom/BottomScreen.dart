import 'package:flutter/material.dart';
import 'package:flutter_demo_app/bottom/ExerciseScreen.dart';
import 'package:flutter_demo_app/bottom/HomeScreen.dart';
import 'package:flutter_demo_app/bottom/SettingsScreen.dart';

class BottomView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomViewState();
}

class BottomViewState extends State<BottomView> {
  int _currentIndex = 0;

  List<Widget> _screens = [HomeScreen(), ExerciseScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom")),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => _onChangeIndex(value),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group_work_outlined), label: 'Exercise'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  _onChangeIndex(int screenIndex) {
    _currentIndex = screenIndex;
    setState(() {});
  }
}
