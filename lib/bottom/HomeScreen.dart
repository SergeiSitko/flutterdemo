import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'SettingsScreen.dart';
import 'expanded_view.dart';

class HomeScreen extends StatelessWidget {

  final _logger = Logger(printer: SimpleLogPrinter());

  @override
  Widget build(BuildContext context) {
    _logger.d("HomeScreen");
    var safeArea = SafeArea(
      child: Column(
        children: [
          Center(child: Text("Home")),
          Row(
            children: [
              ExpandedView(),
              ExpandedView(),
            ],
          )
        ],
      ),
    );
    return safeArea;
  }
}
