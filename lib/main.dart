import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rapid_pass/services/my_http_overrides.dart';
import 'package:rapid_pass/views/base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
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
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const Base(),
    );
  }
}
