import 'package:flutter/material.dart';
import 'package:linkedin_clone/view_models/feed_viewmodel.dart';
import 'package:linkedin_clone/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  final FeedViewModel viewModel = FeedViewModel();

  FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = viewModel.getPosts();

    return Scaffold(
      backgroundColor: Colors.grey[50],      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/user_1.jpg'),
            ),
            Image.asset('assets/images/logo.png', height: 70),
            Image.asset('assets/icons/notification.png', height: 30),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: "Try 'Android Dev'",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icons/search.png',
                  width: 20,
                  height: 20,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icons/qr.png',
                  width: 20,
                  height: 20,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/images/user${(index % 6) + 1}.jpg",
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // Posts
          ...posts.map((post) => PostCard(post: post)).toList(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the floating action button
        },
        backgroundColor: const Color(0xFF0077B5),
        elevation: 4.0,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 15.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset('assets/icons/home.png', width: 24, height: 24),
              onPressed: () {
                // Action for home button
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/people.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                // Action for people button
              },
            ),
            const SizedBox(width: 48), // Space for the FAB
            IconButton(
              icon: Image.asset('assets/icons/chat.png', width: 24, height: 24),
              onPressed: () {
                // Action for chat button
              },
            ),
            IconButton(
              icon: Image.asset('assets/icons/jobs.png', width: 24, height: 24),
              onPressed: () {
                // Action for jobs button
              },
            ),
          ],
        ),
      ),
    );
  }
}
