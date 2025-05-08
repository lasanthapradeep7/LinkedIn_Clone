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
              leading: CircleAvatar(backgroundImage: AssetImage(post.profileUrl)),
              title: Text(post.username),
              subtitle: Text('${post.role} · ${post.time}'),
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
                CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/images/user1.jpg")),
                const SizedBox(width: 5),
                Text("Liked by Budi and ${post.likes} others"),
              ],
            ),
            const SizedBox(height: 5),
            Text("${post.comments} comments", style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
