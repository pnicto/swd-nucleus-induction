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
