import 'package:flutter/material.dart';
import '../models/post_model.dart';

class DisplayPosts extends StatelessWidget {
  final List<Post>? posts;
  final int userId;
  const DisplayPosts(this.posts, this.userId, {Key? key}) : super(key: key);

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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currentUserPosts![index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currentUserPosts[index].body,
                    style: const TextStyle(),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      itemCount: currentUserPosts?.length,
    );
  }
}
