import 'package:flutter/material.dart';
import 'package:json_api_app/pages/about_me_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
            ),
            child: const Center(
              child: Text(
                'JSON API',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.smartphone),
            title: const Text('Main app'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About me'),
            onTap: () {
              Navigator.of(context).pushNamed(AboutMe.routeName);
            },
          ),
        ],
      ),
    );
  }
}
