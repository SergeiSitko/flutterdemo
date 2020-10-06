import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/bloc/CountBloc.dart';
import 'package:flutter_demo_app/view/CountView.dart';

import 'bloc/color_background_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Column(
        children: [
          _buildCountItem(),
          _buildCountItem(),
        ],
      ),
    );
  }

  Widget _buildCountItem() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ColorBackgroundBloc()),
      ],
      child: Container(
        color: Colors.cyan,
        height: 400,
        child: CountsView(),
      ),
    );
  }
}
