import 'package:flutter/material.dart';
import 'package:linkedin_clone/views/feed_view.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/views/signup_view.dart';
import 'package:linkedin_clone/view_models/auth_viewmodel.dart';
import '../constants/colors.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Container(
                alignment: const Alignment(0, -0.5),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 120,
                ),
              ),
              const Text(
                "Sign in",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              const Text(
                "Stay updated on your professional world",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email or Phone",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixText: "show",
                  suffixStyle: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  // Add forgot password logic
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  vm.login(emailController.text, passwordController.text);
                  if (!vm.isAuthenticated) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => FeedView()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid credentials")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: primaryColor,
                ),
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  // Add Google sign-in logic
                },
                icon: Image.asset(
                  'assets/icons/google.png',
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  "Sign in with Google",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  // Add Apple sign-in logic
                },
                icon: Image.asset(
                  'assets/icons/apple.png',
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  "Sign in with Apple",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupView()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
