import 'package:flutter/material.dart';
import 'package:medx/ui/auth/onboarding_screen.dart';

class MedxApp extends StatefulWidget {
  const MedxApp({Key? key}) : super(key: key);

  @override
  _MedxAppState createState() => _MedxAppState();
}

class _MedxAppState extends State<MedxApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingPage(),
    );
  }
}
