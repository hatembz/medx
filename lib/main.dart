import 'package:flutter/material.dart';
import 'package:medx/medxapp.dart';
import 'package:medx/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kBlueColor),
          useMaterial3: true,
          fontFamily: 'source-sans-pro',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: kBlueColor)),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 34,
              color: Colors.black,
            ),
            headlineMedium: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
            displaySmall: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            labelSmall: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            titleSmall: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            titleMedium: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            labelMedium: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          )),
      home: const MedxApp(),
    );
  }
}
