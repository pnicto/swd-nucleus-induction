import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var isLoaded = false;

  List<User>? users;
  Future<List<User>?> fetchUser() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<User>((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  fetchUsers() async {
    users = await fetchUser();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? (ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                    child: ListTile(
                      tileColor: Colors.blue.shade400,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      leading: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Text(users![index].name),
                      subtitle: Text(users![index].email),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 4,
                  // )
                ],
              );
            },
            itemCount: users?.length,
          ))
        : (const Center(
            child: CircularProgressIndicator(),
          ));
  }
}
