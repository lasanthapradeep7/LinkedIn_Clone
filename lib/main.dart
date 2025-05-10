import 'package:flutter/material.dart';
import 'package:linkedin_clone/screens/user_profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/view_models/auth_viewmodel.dart';
import 'package:linkedin_clone/view_models/user_profile_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProfileViewModel()..loadUserData(),
        ),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserProfileScreen(),
        theme: ThemeData(fontFamily: "Inter"),
      ),
    ),
  );
}
