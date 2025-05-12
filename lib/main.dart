import 'package:flutter/material.dart';
import 'package:linkedin_clone/views/main_view.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/view_models/onboarding_view_model.dart';
import 'package:linkedin_clone/view_models/auth_viewmodel.dart';
import 'package:linkedin_clone/view_models/user_profile_viewmodel.dart';
import 'package:linkedin_clone/view_models/feed_viewmodel.dart';
import 'package:linkedin_clone/views/onboarding_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(
          create: (_) => UserProfileViewModel()..loadUserData(),
        ),
        ChangeNotifierProvider(create: (_) => FeedViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn Clone',
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthViewModel>(
        builder: (context, authViewModel, _) {
          return authViewModel.isAuthenticated
              ? const MainView()
              : const OnboardingView();
        },
      ),
    );
  }
}
