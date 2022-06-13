import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../pages/post_comments_page.dart';

class DisplayPosts extends StatefulWidget {
  final List<Post>? posts;
  final int userId;
  const DisplayPosts(this.posts, this.userId, {Key? key}) : super(key: key);

  @override
  State<DisplayPosts> createState() => _DisplayPostsState();
}

class _DisplayPostsState extends State<DisplayPosts> {
  @override
  Widget build(BuildContext context) {
    final List<Post>? currentUserPosts =
        widget.posts?.where((post) => post.userId == widget.userId).toList();
    return ListView.builder(
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              PostComments.routeName,
              arguments: currentUserPosts![index].id,
            );
          },
          child: Card(
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
          ),
        );
      }),
      itemCount: currentUserPosts?.length,
    );
  }
}
