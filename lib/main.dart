import 'package:flutter/material.dart';
import 'package:linkedin_clone/screens/feed_screen.dart';
import 'package:linkedin_clone/screens/login_screen.dart';
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
        theme: ThemeData(fontFamily: "Inter"),
        home: FeedScreen(),
      ),
    ),
  );
}
