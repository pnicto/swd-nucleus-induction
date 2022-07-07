import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/post_comments_page.dart';

import 'pages/about_me_page.dart';
import 'pages/user_details_page.dart';
import 'pages/users_page.dart';
import 'widgets/main_drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.openSansTextTheme(
          const TextTheme(
            headline6: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            headline5: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
            bodyText1: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        cardTheme: CardTheme(elevation: 5, color: Colors.indigo.shade100),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        drawer: const MainDrawer(),
        body: const UsersPage(),
      ),
      routes: {
        UserDetailsPage.routeName: (context) => const UserDetailsPage(),
        AboutMe.routeName: (context) => const AboutMe(),
        PostComments.routeName: (context) => const PostComments(),
      },
    );
  }
}
