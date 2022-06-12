import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);
  static const routeName = '/about-me';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('About me'),
    );
  }
}
