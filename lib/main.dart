import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/bloc/CountBloc.dart';
import 'package:flutter_demo_app/category/category_cubit.dart';
import 'package:flutter_demo_app/di/di_container.dart';
import 'package:flutter_demo_app/state/user_data.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:provider/provider.dart';

import 'bloc/color_background_bloc.dart';
import 'login/bloc/authentication/authentication_bloc.dart';
import 'login/bloc/loginform/login_bloc.dart';
import 'state/state_view.dart';

void main() {
  runApp(MyApp());
}

void initDi(BuildContext context) {
  DiContainer().init(Injector("container"));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initDi(context);

    final authenticationBloc = AuthenticationBloc();

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
          BlocProvider(create: (context) => CategoryCubit()),
          BlocProvider(create: (context) => ColorBackgroundBloc()),
          BlocProvider(create: (context) => authenticationBloc),
          BlocProvider(create: (context) => LoginBloc(authenticationBloc)),
        ],
        child: ChangeNotifierProvider(create: (BuildContext context) => UserStorage.getStorage(), child: StateView()),
      ),
    );
  }
}
