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
    final currentUserPosts = posts?.where((post) => post.userId == userId);
    print(currentUserPosts);
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Card(
          elevation: 5,
          child: Text('Hi'),
        );
      }),
      itemCount: currentUserPosts?.length,
    );
  }
}
