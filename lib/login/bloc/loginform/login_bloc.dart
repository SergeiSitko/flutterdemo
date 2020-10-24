import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/di/di_container.dart';
import 'package:flutter_demo_app/login/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_demo_app/ui/login/_authentication_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository userRepository = DiContainer.inject.get<AuthenticationRepository>();
  final AuthenticationBloc authenticationBloc;

  LoginBloc(
    @required this.authenticationBloc,
  )   : assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    debugPrint("event: $event");
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(event.username, event.password);
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
