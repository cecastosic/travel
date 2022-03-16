import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class LoginProvider implements ChangeNotifier {
  String get userName;
  bool get loggedIn;

  void login(String username);
  void logout();
}

@LazySingleton(as: LoginProvider)
class LoginInfo with ChangeNotifier implements LoginProvider {
  var _userName = '';

  @override
  String get userName => _userName;

  @override
  bool get loggedIn => _userName.isNotEmpty;

  @override
  void login(String userName) {
    _userName = userName;
    print('provider username $userName');
    print('provider loggedIn $loggedIn');

    notifyListeners();
  }

  @override
  void logout() {
    _userName = '';
    notifyListeners();
  }
}

class LoginInfoProvider extends ChangeNotifier {
  var _userName = '';
  String get userName => _userName;
  bool get loggedIn => _userName.isNotEmpty;

  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    notifyListeners();
  }
}
