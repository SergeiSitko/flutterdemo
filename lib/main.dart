import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/bloc/CountBloc.dart';
import 'package:flutter_demo_app/ui/login/_authentication_repository.dart';

import 'file:///C:/Work/flutter_demo_app/lib/login/bloc/authentication/authentication_bloc.dart';
import 'file:///C:/Work/flutter_demo_app/lib/login/bloc/loginform/login_bloc.dart';
import 'file:///C:/Work/flutter_demo_app/lib/login/ui/login_form_view.dart';

import 'bloc/color_background_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = AuthenticationRepository();
    final authenticationBloc = AuthenticationBloc(repository);

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
          BlocProvider(create: (context) => authenticationBloc),
          BlocProvider(create: (context) => LoginBloc(repository, authenticationBloc)),
        ],
        child: LoginFormView(),
      ),
    );
  }
}
