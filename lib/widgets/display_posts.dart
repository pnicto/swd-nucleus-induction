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
    final currentUserPosts = posts?.where((post) => post.id == userId);
    return Container(
      child: Text('Display Posts '),
    );
  }
}
