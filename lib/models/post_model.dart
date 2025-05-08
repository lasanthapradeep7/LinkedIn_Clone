class Post {
  final String username;
  final String role;
  final String time;
  final String description;
  final String imageUrl;
  final String profileUrl;
  final int likes;
  final int comments;

  Post({
    required this.username,
    required this.role,
    required this.time,
    required this.description,
    required this.imageUrl,
    required this.profileUrl,
    required this.likes,
    required this.comments,
  });
}
