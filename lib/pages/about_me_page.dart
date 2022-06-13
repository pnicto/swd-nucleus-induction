import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/main_drawer.dart';

class AboutMe extends StatelessWidget {
  AboutMe({Key? key}) : super(key: key);
  static const routeName = '/about-me';
  final Uri _url = Uri.parse('https://github.com/pnicto');

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About me'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/spongebob.webp'),
                radius: 100,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Hi, I am Dharanikanth studying in BITS Pilani, Hyderabad campus.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'I don\'t have many hobbies. I usually listen to music.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: _launchUrl,
                child: Row(
                  children: const [
                    Icon(
                      Icons.link,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Github',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
