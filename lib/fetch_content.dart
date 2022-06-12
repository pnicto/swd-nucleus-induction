import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/album_model.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';

List<User>? users;
// Function to fetch  users from the url
Future<List<User>?> fetchUser() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

Future<List<Post>?> fetchPostsFromURL() async {
  final response =
      await http.get(Uri.parse('http://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<List<Album>?> fetchAlbumsFromURL() async {
  final response =
      await http.get(Uri.parse('http://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load albums');
  }
}
