import 'package:flutter/material.dart';

import '../fetch_content.dart';
import '../models/album_model.dart';
import '../models/post_model.dart';
import '../widgets/display_albums.dart';
import '../widgets/display_posts.dart';

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
  List<Album>? albums;

  fetchPosts() async {
    posts = await fetchPostsFromURL();
    albums = await fetchAlbumsFromURL();
    if (posts != null && albums != null) {
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
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        content,
        style: const TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
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
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  user['name'] as String,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
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
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${user['name']}\'s Posts',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.all(6),
                      width: double.infinity,
                      height: 250,
                      child: DisplayPosts(
                        posts,
                        user['id'] as int,
                      ),
                    ),
                    const Divider(),
                    Text(
                      '${user['name']}\'s Albums',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.all(6),
                      width: double.infinity,
                      height: 200,
                      child: DisplayAlbums(
                        albums,
                        user['id'] as int,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
