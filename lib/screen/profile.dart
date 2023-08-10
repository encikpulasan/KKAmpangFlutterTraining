import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController(
        text:
            "Hi, I'm interested in knowing more about you.\nWould you like to grab a coffee with me?");

    nameController.addListener(() {
      print(nameController.value);
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/portfolio.png',
                    width: 100,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Azlan Shah'),
                      Text('Mobile Developer'),
                      Text('Kestrl Tech Sdn Bhd'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(
                height: 2,
                color: Colors.black,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(1, 1),
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'email@example.com',
                      ),
                    ),
                    TextField(
                      controller: messageController,
                      maxLines: 5,
                      decoration: const InputDecoration(hintText: 'Message'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        final Uri params = Uri(
                          scheme: 'mailto',
                          path: emailController.text,
                          query:
                              'subject=${nameController.text}&body=${messageController.text}',
                        );

                        var url = params.toString();
                        try {
                          launchUrl(params);
                        } catch (e) {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Text('Contact Me'),
                    ),
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
