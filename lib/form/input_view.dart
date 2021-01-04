import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChoiceChip(
                  label: Text('1'),
                  selected: false,
                  onSelected: (value) => {},
                ),
              ],
            ),
          ),
        ),
      );
}
