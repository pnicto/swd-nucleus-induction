import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
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
            leading: Icon(Icons.smartphone),
            title: Text('Main app'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About me'),
          ),
        ],
      ),
    );
  }
}
