import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  static const routeName = '/user-details';

  Widget buildText(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }

  const UserDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    return Scaffold(
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
                  padding: EdgeInsets.all(15),
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
            )
          ],
        ),
      ),
    );
  }
}
