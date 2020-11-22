import 'package:flutter/material.dart';

class ExpandedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(color: Colors.yellow, border: Border.all()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("ExpandedView", style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        ),
      );
}
