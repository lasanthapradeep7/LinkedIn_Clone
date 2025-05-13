import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:linkedin_clone/models/auth_model.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isAuthenticated = false;
  UserModel? _user;

  bool get isAuthenticated => _isAuthenticated;
  UserModel? get user => _user;

  // Save user credentials to SharedPreferences
  Future<void> signup(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);

    _isAuthenticated = true;
    _user = UserModel(email: email, password: password);
    notifyListeners();
  }

  // Validate user credentials from SharedPreferences
  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if (email == savedEmail && password == savedPassword) {
      _isAuthenticated = true;
      _user = UserModel(email: email, password: password);
      notifyListeners();
      return true;
    } else {
      _isAuthenticated = false;
      notifyListeners();
      return false;
    }
  }

  // Logout user and clear session
  Future<void> logout() async {
    _isAuthenticated = false;
    _user = null;
    notifyListeners();
  }

  // Check if a user is already logged in
  Future<void> checkAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if (savedEmail != null && savedPassword != null) {
      _isAuthenticated = true;
      _user = UserModel(email: savedEmail, password: savedPassword);
    } else {
      _isAuthenticated = false;
      _user = null;
    }
    notifyListeners();
  }
}