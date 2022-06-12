import 'package:flutter/material.dart';

import '../fetch_content.dart';
import '../models/post_model.dart';

class UserDetailsPage extends StatefulWidget {
  static const routeName = '/user-details';

  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  // Control loading spinner
  var isLoaded = false;

  List<Post>? posts;
  // Function to fetch all posts

  fetchPosts() async {
    posts = await fetchPostsFromURL();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Widget buildText(String content) {
    return Text(
      content,
      style: const TextStyle(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return isLoaded
        ? Scaffold(
            appBar: AppBar(
              title: Text("${user['name']}'s Details"),
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            buildText(user['name'] as String),
                            buildText(user['username'] as String),
                            buildText(user['email'] as String),
                            buildText(user['phone'] as String),
                            buildText(user['website'] as String),
                            buildText(user['company'] as String),
                            buildText(user['address'] as String),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
