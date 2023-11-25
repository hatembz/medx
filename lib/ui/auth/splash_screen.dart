import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/ui/auth/authanticate_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    await Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => AuthanticateScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(1.00, 0.00),
        end: Alignment(-1, 0),
        colors: [Color(0xFF4485FD), Color(0xFF2972FE)],
      )),
      child: Center(
        child: Image.asset('assets/icons/logo.png'),
      ),
    );
  }
}
