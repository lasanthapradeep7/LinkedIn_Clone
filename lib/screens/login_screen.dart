import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/screens/signup_screen.dart';
import 'package:linkedin_clone/screens/user_profile_screen.dart';
import 'package:linkedin_clone/view_models/auth_viewmodel.dart';


class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign in", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 12),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                vm.login(emailController.text, passwordController.text);
                if (vm.isAuthenticated) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserProfileScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid credentials")));
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
              },
              child: Text("Don't have an account? Sign up"),
            )
          ],
        ),
      ),
    );
  }
}