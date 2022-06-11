import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: const Center(
              child: Text('JSON APi'),
            ),
          ),
        ],
      ),
    );
  }
}
