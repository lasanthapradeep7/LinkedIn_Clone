import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/colors.dart';
import '../../models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
              title: Text(
                post.username,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('${post.role}\n${post.time}'),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  // action
                },
              ),
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
                      left: 8,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage("assets/images/user_2.jpg"),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage("assets/images/user_3.jpg"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Text.rich(
                  TextSpan(
                    text: 'Liked by ',
                    children: [
                      TextSpan(
                        text: 'Budi',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: '${post.likes} others',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  "${post.comments} comments",
                  style: TextStyle(fontWeight: FontWeight.w600),
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
                        width: 28,
                        height: 28,
                        color: iconColor,
                      ),
                      onPressed: () {
                        // Like action
                      },
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/chat.png',
                        width: 24,
                        height: 24,
                        color: iconColor,
                      ),
                      onPressed: () {
                        // Comment action
                      },
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/share.png',
                        width: 24,
                        height: 24,
                        color: iconColor,
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
                    color: iconColor,
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
