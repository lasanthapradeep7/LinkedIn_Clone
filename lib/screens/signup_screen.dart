import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/screens/user_profile_screen.dart';
import 'package:linkedin_clone/view_models/auth_viewmodel.dart';


class SignupScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign up", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 12),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                vm.signup(emailController.text, passwordController.text);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserProfileScreen()));
              },
              child: Text("Create account"),
            ),
          ],
        ),
      ),
    );
  }
}