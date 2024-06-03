import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_pass/providers/balance_provider.dart';
import 'package:rapid_pass/providers/get_information_provider.dart';
import 'package:rapid_pass/providers/theme_provider.dart';
import 'package:rapid_pass/services/my_http_overrides.dart';
import 'package:rapid_pass/views/base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        Provider<BalanceProvider>(
          create: (_) => BalanceProvider(),
        ),
        ChangeNotifierProvider<GetInformationProvider>(
          create: (_) => GetInformationProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rapid Pass',
      theme: ThemeData(
        fontFamily: 'SolaimanLipi',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          // brightness: Brightness.light,
          brightness: context.watch<ThemeProvider>().lightTheme
              ? Brightness.light
              : Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const Base(),
    );
  }
}
