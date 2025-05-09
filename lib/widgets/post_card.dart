import 'package:flutter/material.dart';
import '../../models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(post.profileUrl),
              ),
              title: Text(post.username),
              subtitle: Text('${post.role}\n${post.time}'),
              trailing: Icon(Icons.more_vert),
            ),
            const SizedBox(height: 10),
            Text(post.description),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(post.imageUrl),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage("assets/images/user_1.jpg"),
                    ),
                    Positioned(
                      left: 12,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage("assets/images/user_2.jpg"),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage("assets/images/user_3.jpg"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Text(
                  "Liked by Budi and ${post.likes} others",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "${post.comments} comments",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/like.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        // Like action
                      },
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/chat.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        // Comment action
                      },
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/share.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        // Share action
                      },
                    ),
                  ],
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/icons/save.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    // Save action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
