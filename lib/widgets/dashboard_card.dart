import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/user_profile_model.dart';

class DashboardCard extends StatelessWidget {
  final UserProfile profile;

  const DashboardCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Dashboard", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [Text('${profile.profileViews}'), Text("Who viewed\nyour profile", textAlign: TextAlign.center)]),
                Column(children: [Text('${profile.postViews}'), Text("Post Views")]),
                Column(children: [Text('${profile.searchAppearances}'), Text("Search\nAppearances", textAlign: TextAlign.center)]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
