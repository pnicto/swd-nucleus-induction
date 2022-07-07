import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/main_drawer.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);
  static const routeName = '/about-me';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About me'),
      ),
      drawer: const MainDrawer(), // MainDrawer custom widget

      // SingleChildScrollView to keep make it work on landscape mode or smaller screens
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          // Column with the main content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circle Avatar for spongebob image :)
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/spongebob.webp'),
                radius: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              // Content Card
              Card(
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
              const SizedBox(
                height: 10,
              ),
              // Content Card
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'I am from Anantapur.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Content Card
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'I usually listen to music and play singleplayer games.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Row to align the icons in center
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    // on pressed action to launch the url
                    onPressed: () async {
                      final Uri url = Uri.parse(
                        'https://github.com/pnicto',
                      );
                      if (!await launchUrl(
                        url,
                        // mode to launch them in apps
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw 'Could not launch $url';
                      }
                    },
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
                  TextButton(
                    // on pressed action to launch the url
                    onPressed: () async {
                      final Uri url = Uri.parse(
                        'https://www.linkedin.com/in/dharanikanth-reddy-9386b623b/',
                      );
                      if (!await launchUrl(
                        url,
                        // mode to launch them in apps
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.link,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Linkedin',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
