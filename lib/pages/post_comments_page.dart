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
    // PostID to separate the comments of the post
    final postId = ModalRoute.of(context)?.settings.arguments as int;
    // segregated comments var
    final currentComments =
        comments?.where((comment) => comment.postId == postId).toList();

// Logic to see if the data is loaded if loaded then display comments if not show circular progress indicator
    return isLoaded
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Comments'),
            ),

            // Passing those comments into custom widget to dislpay comments
            body: DisplayComments(
              currentComments,
            ),
          )
        : Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
