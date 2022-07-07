import 'package:flutter/material.dart';

import '../pages/about_me_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.indigo.shade400,
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'JSON API',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.smartphone,
              color: Colors.white,
            ),
            title: const Text(
              'Main app',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Divider(
              color: Colors.white,
              thickness: 1.1,
              indent: 2,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: const Text(
              'About me',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AboutMe.routeName);
            },
          ),
        ],
      ),
    );
  }
}
