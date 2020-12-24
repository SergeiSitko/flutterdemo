import 'package:flutter/material.dart';

class ViewGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 300, height: 300, color: Colors.lightGreen),
                  Container(width: 200, height: 200, color: Colors.green),
                  Container(width: 100, height: 100, color: Colors.red),
                  Container(width: 50, height: 50, color: Colors.yellow),
                ],
              ),
            ),
          ),
        ),
      );
}
