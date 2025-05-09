import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/user_profile_model.dart';


class UserProfileViewModel extends ChangeNotifier {
  late UserProfile _userProfile;

  UserProfile get profile => _userProfile;

  void loadUserData() {
    _userProfile = UserProfile(
      name: "Stebin Alex",
      role: "Freelance iOS Developer | UIKit | SwiftUI |",
      skills:"Talks about #swift, #swiftui, and #iosdevelopment",
      company: "LEAN TRANSITION SOLUTIONS - LTS",
      location: "Thiruvananthapuram, Kerala, India",
      followers: 4413,
      connections: 500,
      profileViews: 111,
      postViews: 500,
      searchAppearances: 85,
    );
    notifyListeners();
  }
}
