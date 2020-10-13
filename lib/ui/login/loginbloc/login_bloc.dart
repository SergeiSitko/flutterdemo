import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/ui/login/AuthenticationRepository.dart';

// import 'package:flutter_demo_app/ui/login/authentication/authentication_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository userRepository;

  // final AuthenticationBloc authenticationBloc;

  LoginBloc(
    @required this.userRepository,
    // @required this.authenticationBloc,
  )   : assert(userRepository != null),
        // assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    debugPrint("event: $event");
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(event.username, event.password);
        // authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
