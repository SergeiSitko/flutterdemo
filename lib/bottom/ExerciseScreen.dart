import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'SettingsScreen.dart';
import 'expanded_view.dart';
import 'flexible_view.dart';

class ExerciseScreen extends StatelessWidget {
  final _logger = Logger(printer: SimpleLogPrinter());

  @override
  Widget build(BuildContext context) {
    _logger.d("ExerciseScreen");

    var safeArea = SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Exercise"),
              Row(children: [ExpandedView(), FlexibleView()]),
              Row(children: [FlexibleView(), FlexibleView()]),
              Row(children: [ExpandedView(), ExpandedView()]),
              Row(children: [FlexibleView(), ExpandedView()]),
            ],
          ),
        ),
      );
    return safeArea;
  }
}
