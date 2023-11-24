import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medx/ui/auth/signin_screen.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/utils/constants.dart';

class AuthanticateScreen extends StatelessWidget {
  const AuthanticateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 44),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Center(
                      child: Image.asset('assets/icons/logoBlue.png'),
                    ),
                  )),
              CustomButton(title: 'Sign up'),
              SizedBox(height: 33),
              OutlinedButton(
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SigninScreen())),
                  child: Text(
                    'Sign in',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: kBlueColor),
                  ),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: const StadiumBorder(),
                    side: const BorderSide(width: 2, color: kBlueColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
