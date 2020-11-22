import 'package:flutter/material.dart';
import 'package:flutter_demo_app/bottom/flexible_view.dart';

import 'expanded_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
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
}
