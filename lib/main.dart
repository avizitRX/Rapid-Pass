import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_pass/providers/balance_provider.dart';
import 'package:rapid_pass/providers/get_information_provider.dart';
import 'package:rapid_pass/providers/map_timeline_tile_provider.dart';
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
        ChangeNotifierProvider<MapTimelineTileProvider>(
          create: (_) => MapTimelineTileProvider(),
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
    bool isLightTheme = context.watch<ThemeProvider>().lightTheme;

    // Define the light theme color scheme
    ColorScheme lightScheme = ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      brightness: Brightness.light,
    );

    // Define the dark theme color scheme, using the light theme's primary color
    ColorScheme darkScheme = ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      brightness: Brightness.dark,
    ).copyWith(
      primaryFixedDim: lightScheme.primary, // Use light theme's primary color
    );
    return MaterialApp(
      title: 'Rapid Pass',
      theme: ThemeData(
        fontFamily: 'SolaimanLipi',
        colorScheme: lightScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: 'SolaimanLipi',
        colorScheme: darkScheme,
        useMaterial3: true,
      ),
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      home: const Base(),
    );
  }
}
