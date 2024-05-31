import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_pass/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {
              context.read<ThemeProvider>().changeTheme();
            },
            child: const Text('Change Theme'),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.remove('cardNumber');
              await prefs.remove('name');
              await prefs.remove('cardStatus');
            },
            child: const Text('Clear Card Information'),
          ),
        ],
      ),
    );
  }
}
