import 'package:flutter/material.dart';
import '../models/comment_model.dart';

class DisplayComments extends StatelessWidget {
  final int postId;
  final List<Comment>? comments;

  const DisplayComments(this.postId, this.comments, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments?.length,
      itemBuilder: ((context, index) {
        return Container(
          margin: const EdgeInsets.all(14),
          child: Card(
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    comments![index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    comments![index].email,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    comments![index].body,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
