import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/colors.dart';
import 'package:linkedin_clone/views/chat_view.dart';
import 'package:linkedin_clone/views/feed_view.dart';
import 'package:linkedin_clone/views/jobs_view.dart';
import 'package:linkedin_clone/views/people_view.dart';
import 'package:linkedin_clone/views/user_profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    const FeedView(),
    const PeopleView(),
    const ChatView(),
    const JobsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserProfileView()),
                );
              },
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/user_1.jpg'),
              ),
            ),
            Image.asset('assets/images/logo.png', height: 80),
            IconButton(
              icon: Image.asset('assets/icons/notification.png', height: 30),
              onPressed: () {
                // Action for notifications
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex], // Display the selected page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the FAB
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 16.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset(
                'assets/icons/home.png',
                height: 24,
                width: 24,
                color: _currentIndex == 0 ? primaryColor : iconColor,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0; // Navigate to FeedPage
                });
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/people.png',
                height: 24,
                width: 24,
                color: _currentIndex == 1 ? primaryColor : iconColor,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1; // Navigate to PeoplePage
                });
              },
            ),
            const SizedBox(width: 56), // Space for the FAB
            IconButton(
              icon: Image.asset(
                'assets/icons/chat.png',
                height: 24,
                width: 24,
                color: _currentIndex == 2 ? primaryColor : iconColor,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 2; // Navigate to ChatPage
                });
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/jobs.png',
                height: 24,
                width: 24,
                color: _currentIndex == 3 ? primaryColor : iconColor,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 3; // Navigate to JobsPage
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
