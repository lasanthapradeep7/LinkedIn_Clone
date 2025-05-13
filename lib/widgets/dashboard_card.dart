import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/user_profile_model.dart';
import '../constants/colors.dart';

class DashboardCard extends StatelessWidget {
  final UserProfile profile;

  const DashboardCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dashBoardColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Your Dashboard",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Private to you",
                      style: TextStyle(
                        fontSize: 14,
                        color: secondaryColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.star, size: 26, color: Colors.black),
                    SizedBox(width: 4),
                    Text(
                      "ALL-STAR",
                      style: TextStyle(fontSize: 18, color: secondaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Metrics section with smaller cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildMetricColumn(
                        context,
                        value: '${profile.profileViews}',
                        label: "Who viewed your profile",
                      ),
                    ),
                    _buildVerticalDivider(),
                    Expanded(
                      child: _buildMetricColumn(
                        context,
                        value: '${profile.postViews}',
                        label: "Post Views",
                      ),
                    ),
                    _buildVerticalDivider(),
                    Expanded(
                      child: _buildMetricColumn(
                        context,
                        value: '${profile.searchAppearances}',
                        label: "Search appearances",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Creator mode card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.wifi_tethering,
                          size: 24,
                          color: Colors.black,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Creator mode: On",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Get discovered, showcase content on your profile, and get access to creator tools",
                      style: TextStyle(fontSize: 13, color: secondaryColor),
                    ),
                    const Divider(
                      height: 24,
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.people, size: 24, color: Colors.black),
                        SizedBox(width: 12),
                        Text(
                          "My network",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "See and manage your connections and interests.",
                      style: TextStyle(fontSize: 13, color: secondaryColor),
                    ),
                    const Divider(
                      height: 24,
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          // Add your navigation or action logic here
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: primaryColor,
                        ),
                        label: const Text(
                          "Show all resources",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build each metric column
  Widget _buildMetricColumn(
    BuildContext context, {
    required String value,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 13, color: secondaryColor),
        ),
      ],
    );
  }

  // Helper method to build a vertical divider
  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: secondaryColor,
    );
  }
}
