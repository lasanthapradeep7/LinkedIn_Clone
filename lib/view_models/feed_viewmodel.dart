import 'package:linkedin_clone/models/post_model.dart';

class FeedViewModel {
  List<Post> getPosts() {
    return [
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
  }
}
