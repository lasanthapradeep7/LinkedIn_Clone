import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/view_models/auth_viewmodel.dart';
import 'package:linkedin_clone/models/user_profile_model.dart';
import '../constants/colors.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfile profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    return Stack(
      children: [
        // Cover photo
        Stack(
          children: [
            Image.asset(
              'assets/images/cover.jpg',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            // Edit icon for cover photo
            Positioned(
              top: 50,
              right: 10,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    // Action
                  },
                  icon: Icon(Icons.edit, size: 18, color: primaryColor),
                ),
              ),
            ),
          ],
        ),
        // Profile picture
        Positioned(
          top: 100,
          left: 16,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user_1.jpg'),
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: thirdColor,
                child: Icon(Icons.add, size: 22, color: Colors.black),
              ),
            ],
          ),
        ),
        // Edit icon for profile details with popup menu
        Positioned(
          top: 170,
          right: 16,
          child: PopupMenuButton<String>(
            color: thirdColor,
            onSelected: (value) async {
              if (value == 'settings') {
                // Navigate to settings page
                Navigator.pushNamed(context, '/settings');
              } else if (value == 'logout') {
                // Perform logout
                await authViewModel.logout();
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            icon: Icon(Icons.edit, color: secondaryColor),
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: 'settings',
                    child: Row(
                      children: const [
                        Icon(Icons.settings, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Settings'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: const [
                        Icon(Icons.logout, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Logout'),
                      ],
                    ),
                  ),
                ],
          ),
        ),

        // Profile details
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 210, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    profile.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.volume_up, color: Colors.black, size: 20),
                ],
              ),
              Text(
                profile.role,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                profile.skills,
                style: TextStyle(color: secondaryColor, fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                profile.company,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                profile.location,
                style: TextStyle(color: secondaryColor, fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                "${profile.followers} followers • ${profile.connections}+ connections",
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  // "Open to" button
                  ElevatedButton(
                    onPressed: () {
                      // Action for "Open to"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(145, 30),
                    ),
                    child: const Text(
                      "Open to",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // "Add section" button
                  OutlinedButton(
                    onPressed: () {
                      // Action for "Add section"
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: secondaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(145, 30),
                    ),
                    child: const Text(
                      "Add section",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Three-dot menu button
                  IconButton(
                    onPressed: () {
                      // Action for three-dot menu
                    },
                    icon: Icon(Icons.more_horiz, color: secondaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Open to work section
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Number of cards
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Open to work",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Action for editing the card
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "iOS Developer roles",
                            style: TextStyle(fontSize: 13),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Action for "See all details"
                            },
                            child: const Text(
                              "See all details",
                              style: TextStyle(
                                fontSize: 13,
                                color: primaryColor,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
