import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/user_profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfile profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
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
                  icon: Icon(Icons.edit, size: 18, color: Colors.blue),
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
                backgroundImage: AssetImage('assets/images/user_4.jpg'),
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(Icons.add, size: 22, color: Colors.black),
              ),
            ],
          ),
        ),
        // Edit icon for profile details
        Positioned(
          top: 170,
          right: 16,
          child: IconButton(
            onPressed: () {
              // Action
            },
            icon: Icon(Icons.edit, color: Colors.grey),
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.volume_up, color: Colors.black, size: 20),
                ],
              ),
              Text(profile.role, style: TextStyle(fontSize: 16)),
              Text(
                profile.skills,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 10),
              Text(profile.company, style: TextStyle(fontSize: 16)),
              Text(
                profile.location,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 10),
              Text(
                "${profile.followers} followers • ${profile.connections}+ connections",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  // "Open to" button
                  ElevatedButton(
                    onPressed: () {
                      // Action for "Open to"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
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
                        fontWeight: FontWeight.w400,
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
                      side: BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(145, 30),
                    ),
                    child: const Text(
                      "Add section",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Three-dot menu button
                  IconButton(
                    onPressed: () {
                      // Action for three-dot menu
                    },
                    icon: Icon(Icons.more_horiz, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Open to work section
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Number of cards
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
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
                                  fontWeight: FontWeight.w400,
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
                                fontSize: 14,
                                color: Colors.blue,
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
