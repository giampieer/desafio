import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  // validacion login
  bool _statusResponseLogin = false;

  bool get statusResponseLogin => _statusResponseLogin;

  void verificationLogin(String username, String password) {
    _statusResponseLogin = false;
    if (username == 'usuario' && password == '123456') {
      _statusResponseLogin = true;
    }
    notifyListeners();
  }
}
