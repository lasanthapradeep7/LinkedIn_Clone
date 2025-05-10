import 'package:flutter/material.dart';
import '../models/auth_model.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login(String email, String password) {
    if (email == "test@example.com" && password == "password") {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  void signup(String email, String password) {
    // Simulate signup logic
    _isAuthenticated = true;
    notifyListeners();
  }
}