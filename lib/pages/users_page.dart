import 'package:flutter/material.dart';

import '../fetch_content.dart';
import 'user_details_page.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  // var to control Loading screen
  var isLoaded = false;

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
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 30.0,
                ),
                child: GestureDetector(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.lightBlueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    users![index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    users![index].username,
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    users![index].email,
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    users![index].phone,
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.person,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.cyan,
                        thickness: 0.6,
                      ),
                    ],
                  ),
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
                ),
              );
            },
            itemCount: users?.length,
          ))
        : (const Center(
            child: CircularProgressIndicator(),
          ));
  }
}
