import 'package:flutter/cupertino.dart';

class AuthenticationRepository {
  Future<String> hasToken() => Future.delayed(Duration(seconds: 1), () => "token");

  Future<String> authenticate(@required String login, @required String password) async => await Future.delayed(Duration(seconds: 1), () => "token");

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }
}
