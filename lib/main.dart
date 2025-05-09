import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/view_models/user_profile_viewmodel.dart';
import 'package:linkedin_clone/screens/user_profile_screen.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProfileViewModel()..loadUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserProfileScreen(),
      ),
    ),
  );
}
