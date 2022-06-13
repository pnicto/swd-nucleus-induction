import 'package:flutter/material.dart';

import '../fetch_content.dart';
import '../models/comment_model.dart';
import '../widgets/display_comments.dart';

class PostComments extends StatefulWidget {
  static const routeName = '/comments';
  const PostComments({Key? key}) : super(key: key);

  @override
  State<PostComments> createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  var isLoaded = false;
  List<Comment>? comments;

  fetchComments() async {
    comments = await fetchCommentsFromURL();
    if (comments != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)?.settings.arguments as int;

    final currentComments =
        comments?.where((comment) => comment.postId == postId).toList();

    return isLoaded
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Comments'),
            ),
            body: DisplayComments(
              postId,
              currentComments,
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
