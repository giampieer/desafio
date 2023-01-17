import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  // validacion login
  bool verificationLogin(String username, String password) {
    bool statusResponseLogin = false;
    if (username == 'usuario' && password == '123456') {
      statusResponseLogin = true;
    }
    return statusResponseLogin;
  }
}
