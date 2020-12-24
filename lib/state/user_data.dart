import 'package:flutter/material.dart';

class UserStorage extends ChangeNotifier {
  static UserStorage _storage;

  static UserStorage getStorage() {
    if (_storage == null) {
      _storage = UserStorage();
    }
    return _storage;
  }

  List<User> users = [];

  addUser(User user) {
    users.add(user);
    notifyListeners();
  }

  clearAll() {
    users.clear();
    notifyListeners();
  }

  removeLast() {
    if (users.isEmpty) {
      return;
    }

    users.removeLast();
    notifyListeners();
  }
}

class User {
  String name;
  int age;

  User(this.name, this.age)
      : assert(name != null),
        assert(age > 0);
}
