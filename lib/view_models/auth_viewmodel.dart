import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/auth_model.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isAuthenticated = false;
  UserModel? _user;

  bool get isAuthenticated => _isAuthenticated;
  UserModel? get user => _user;

  void login(String email, String password) {
    if (email == "test@email.com" && password == "1234") {
      _isAuthenticated = true;
      _user = UserModel(email: email, password: password);
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  void signup(String email, String password) {
    _isAuthenticated = true;
    _user = UserModel(email: email, password: password);
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _user = null;
    notifyListeners();
  }
}
