import 'package:flutter/material.dart';
import 'package:linkedin_clone/models/post_model.dart';

class FeedViewModel extends ChangeNotifier {
  final List<Post> _posts = [
    Post(
      username: "Tony Antonio · 2nd",
      role: "Android Dev at Nixo",
      time: "1w · Edited",
      description:
          "Creating opportunity for every member of the global workforce drives everything we do at LinkedIn...",
      imageUrl: "assets/images/keyboard.jpg",
      profileUrl: "assets/images/user_2.jpg",
      likes: 97,
      comments: 77,
    ),
    Post(
      username: "Andy Orton",
      role: "Web Dev at Nixo",
      time: "1w · Edited",
      description:
          "Creating opportunity for every member of the global workforce drives everything we do at LinkedIn...",
      imageUrl: "assets/images/keyboard.jpg",
      profileUrl: "assets/images/user_6.jpg",
      likes: 85,
      comments: 60,
    ),
  ];

  List<Post> get posts => _posts;

  void addPost(Post post) {
    _posts.add(post);
    notifyListeners(); // Notify listeners about the change
  }
}