import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_app/di/di_container.dart';
import 'package:flutter_demo_app/login/bloc/screen_navigator.dart';
import 'package:flutter_demo_app/ui/login/_authentication_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final ScreenNavigator navigator = DiContainer.inject.get<ScreenNavigatorImpl>();
  final AuthenticationRepository repository = DiContainer.inject.get<AuthenticationRepository>();

  AuthenticationBloc() : super(AuthenticationState.AuthenticationUnknown);

  @override
  AuthenticationState get initialState => AuthenticationState.AuthenticationUnknown;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AppStarted:
        final String token = await repository.hasToken();
        if (token == null) {
          yield AuthenticationState.AuthenticationLoggedOut;
        } else {
          yield AuthenticationState.AuthenticationLoggedIn;
        }

        break;
      case LoggedIn:
        await repository.persistToken((event as LoggedIn).token);
        yield AuthenticationState.AuthenticationLoggedIn;
        break;
      case LoggedOut:
        await repository.deleteToken();
        yield AuthenticationState.AuthenticationLoggedOut;
        break;
    }
  }
}
