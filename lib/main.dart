import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/bloc/CountBloc.dart';
import 'package:flutter_demo_app/ui/login/AuthenticationRepository.dart';
import 'package:flutter_demo_app/ui/login/authentication/authentication_bloc.dart';
import 'package:flutter_demo_app/ui/login/login_view.dart';

import 'bloc/color_background_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = AuthenticationRepository();


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        focusColor: Colors.orange,
        hintColor: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => ColorBackgroundBloc()),
          BlocProvider(create: (context) => AuthenticationBloc(repository: repository)),
        ],
        child: LoginView(),
      ),
    );
  }
}
