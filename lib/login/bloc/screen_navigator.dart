import 'package:flutter/material.dart';
import 'package:flutter_demo_app/login/ui/login_form_view.dart';
import 'package:flutter_demo_app/login/ui/login_main_view.dart';
import 'package:flutter_demo_app/login/ui/login_splash_view.dart';

abstract class ScreenNavigator {
  Future moveToSplash(BuildContext context);

  Future moveToLoginForm(BuildContext context);

  Future moveToMainScreen(BuildContext context);
}

class ScreenNavigatorImpl extends ScreenNavigator {
  @override
  Future moveToLoginForm(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginFormView()));

  @override
  Future moveToMainScreen(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()));

  @override
  Future moveToSplash(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SplashView()));
}
