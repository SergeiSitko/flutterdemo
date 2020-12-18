import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'expanded_view.dart';
import 'flexible_view.dart';

class SettingsScreen extends StatelessWidget {
  final _logger = Logger(printer: SimpleLogPrinter());

  @override
  Widget build(BuildContext context) {
    _logger.d("SettingsScreen");
    var safeArea = SafeArea(
      child: Center(
        child: Column(children: [
          Text("Settings"),
          Row(
            children: [
              FlexibleView(),
              ExpandedView(),
            ],
          ),
        ]),
      ),
    );
    return safeArea;
  }
}

class SimpleLogPrinter extends LogPrinter {
  @override
  void log(Level level, message, error, StackTrace stackTrace) {
    println(message);
  }
}
