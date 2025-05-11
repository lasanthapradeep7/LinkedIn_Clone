import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/view_models/user_profile_viewmodel.dart';
import 'package:linkedin_clone/widgets/profile_header.dart';
import 'package:linkedin_clone/widgets/dashboard_card.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserProfileViewModel>(context);
    final profile = vm.profile;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(profile: profile),
            SizedBox(height: 10),
            DashboardCard(profile: profile),
          ],
        ),
      ),
    );
  }
}
