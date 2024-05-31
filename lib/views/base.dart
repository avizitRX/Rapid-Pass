import 'package:flutter/material.dart';
import 'package:rapid_pass/views/homepage.dart';
import 'package:rapid_pass/views/profile.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: 'হোম',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_rounded),
              label: 'প্রোফাইল',
            ),
          ],
        ),
        body: <Widget>[
          const Homepage(),
          const Profile(),
        ][currentPageIndex],
      ),
    );
  }
}
