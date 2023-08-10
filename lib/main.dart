import 'package:flutter/material.dart';

import 'screen/navbar.dart';
import 'screen/onboarding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      initialRoute: '/',
      routes: {
        '/': (context) => const Onboarding(),
        'navbar': (context) => const NavBar(),
      },
    );
  }
}
