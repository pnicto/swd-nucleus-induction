import 'package:flutter/material.dart';

import '../models/comment_model.dart';

class DisplayComments extends StatelessWidget {
  final List<Comment>? comments;

  const DisplayComments(this.comments, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // List view builder to show comments
    return ListView.builder(
      itemCount: comments?.length,
      itemBuilder: ((context, index) {
        return Container(
          margin: const EdgeInsets.all(14),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    comments![index].name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
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
