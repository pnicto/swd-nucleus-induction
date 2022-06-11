import 'package:flutter/material.dart';

import 'pages/users_page.dart';
import 'widgets/main_drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        drawer: MainDrawer(),
        body: UsersPage(),
      ),
    );
  }
}
