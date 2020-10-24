import 'package:flutter_demo_app/login/bloc/screen_navigator.dart';
import 'package:flutter_demo_app/ui/login/_authentication_repository.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class DiContainer {
  Injector init(Injector injector) {
    injector.map<ScreenNavigatorImpl>((injector) => ScreenNavigatorImpl(), isSingleton: true);
    injector.map<AuthenticationRepository>((injector) => AuthenticationRepository(), isSingleton: true);

    inject = injector;

    return injector;
  }

  static Injector inject;
}
