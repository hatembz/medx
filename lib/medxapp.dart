import 'package:flutter/material.dart';
import 'package:medx/ui/auth/onboarding_screen.dart';
import 'package:medx/ui/auth/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedxApp extends StatefulWidget {
  const MedxApp({Key? key}) : super(key: key);

  @override
  _MedxAppState createState() => _MedxAppState();
}

class _MedxAppState extends State<MedxApp> {
  bool onboardingVisited = true;
  Future<bool> checkIfVisited() async {
    return SharedPreferences.getInstance()
        .then((prefs) => prefs.getBool("onboardingVisited") ?? false);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    onboardingVisited = await checkIfVisited();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !onboardingVisited ? LandingPage() : SplashScreen(),
    );
  }
}
