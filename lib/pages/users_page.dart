import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_api_app/pages/user_details_page.dart';
import '../models/user_model.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  // var to control Loading screen
  var isLoaded = false;

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

// Calling the function in the beginning
  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // returning Loading screen or content depending on isLoaded
    return isLoaded
        ? (ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Container to add margin for list tiles
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                    child: ListTile(
                      // Func to push user details page
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          UserDetailsPage.routeName,
                          arguments: {
                            'id': users![index].id,
                            'name': users![index].name,
                            'username': users![index].username,
                            'email': users![index].email,
                            'phone': users![index].phone,
                            'website': users![index].website,
                            'company': users![index].company.name,
                            'address': users![index].address.city,
                          },
                        );
                      },
                      tileColor: Colors.blue.shade400,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      leading: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Text(users![index].name),
                      subtitle: Text(users![index].email),
                    ),
                  ),
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
