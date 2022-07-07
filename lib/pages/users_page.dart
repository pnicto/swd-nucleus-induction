import 'package:flutter/material.dart';
import '../models/user_model.dart';

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
  List<User>? users;
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
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    users![index].username,
                                  ),
                                  Text(
                                    users![index].email,
                                  ),
                                  Text(
                                    users![index].phone,
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
        : Scaffold(
            appBar: AppBar(),
            body: (const Center(
              child: CircularProgressIndicator(),
            )),
          );
  }
}
