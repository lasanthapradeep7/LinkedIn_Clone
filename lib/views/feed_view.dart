import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkedin_clone/view_models/feed_viewmodel.dart';
import 'package:linkedin_clone/widgets/post_card.dart';
import '../constants/colors.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<FeedViewModel>(context).posts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Try "Android Dev"',
              hintStyle: const TextStyle(color: secondaryColor),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icons/search.png',
                  width: 20,
                  height: 20,
                  color: secondaryColor,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icons/qr.png',
                  width: 20,
                  height: 20,
                  color: secondaryColor,
                ),
              ),
              filled: true,
              fillColor: thirdColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Stories Row
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // First item with + icon
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2), // Border width
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(
                                "assets/images/user_${(index % 6) + 1}.jpg",
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: primaryColor,
                          child: Icon(Icons.add, size: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Other items
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      padding: const EdgeInsets.all(2), // Border width
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/user_${(index % 6) + 1}.jpg",
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          // Posts
          ...posts.map((post) => PostCard(post: post)),
        ],
      ),
    );
  }
}
