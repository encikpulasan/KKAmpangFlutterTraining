import 'package:flutter/material.dart';

import 'home.dart';
import 'profile.dart';
import 'resume.dart';

class Page {
  const Page({
    required this.widget,
    required this.label,
    required this.icon,
  });

  final Widget widget;
  final String label;
  final IconData icon;
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  void navigateTo(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Page> pages = [
    const Page(
      widget: Home(),
      label: 'Home',
      icon: Icons.home_outlined,
    ),
    const Page(
      widget: Resume(),
      label: 'Resume',
      icon: Icons.work_history_outlined,
    ),
    const Page(
      widget: Profile(),
      label: 'Profile',
      icon: Icons.person_outline_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: navigateTo,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(pages[0].icon),
            label: pages[0].label,
          ),
          BottomNavigationBarItem(
            icon: Icon(pages[1].icon),
            label: pages[1].label,
          ),
          BottomNavigationBarItem(
            icon: Icon(pages[2].icon),
            label: pages[2].label,
          ),
        ],
      ),
    );
  }
}
