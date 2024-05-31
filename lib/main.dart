import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_pass/providers/balance_provider.dart';
import 'package:rapid_pass/providers/theme_provider.dart';
import 'package:rapid_pass/views/base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BalanceProvider(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Rapid Pass',
          theme: ThemeData(
            fontFamily: 'SolaimanLipi',
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlue,
              brightness: context.watch<ThemeProvider>().lightTheme
                  ? Brightness.light
                  : Brightness.dark,
            ),
            useMaterial3: true,
          ),
          home: const Base(),
        );
      },
    );
  }
}
