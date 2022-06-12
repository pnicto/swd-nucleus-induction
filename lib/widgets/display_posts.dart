import 'package:flutter/material.dart';
import '../models/post_model.dart';

class DisplayPosts extends StatelessWidget {
  final List<Post>? posts;
  final int userId;
  DisplayPosts(
    this.posts,
    this.userId,
  );

  @override
  Widget build(BuildContext context) {
    final List<Post>? currentUserPosts =
        posts?.where((post) => post.userId == userId).toList();
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Card(
          color: Colors.greenAccent,
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(currentUserPosts![index].title),
                const Text(
                  'Body',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(currentUserPosts[index].body),
              ],
            ),
          ),
        );
      }),
      itemCount: currentUserPosts?.length,
    );
  }
}
