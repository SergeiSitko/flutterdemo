import 'package:flutter/material.dart';

import 'expanded_view.dart';
import 'flexible_view.dart';

class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Exercise"),
              Row(
                children: [
                  ExpandedView(),
                  FlexibleView(),
                ],
              )
            ],
          ),
        ),
      );
}
