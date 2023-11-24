import 'package:flutter/material.dart';
import 'package:medx/ui/auth/authanticate_screen.dart';
import 'package:medx/ui/auth/signin_screen.dart';
import 'package:medx/ui/auth/signup_screen.dart';
import 'package:medx/ui/auth/splash_screen.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/widgets/onboarding_item.dart';
import 'package:medx/utils/constants.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isChecked = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height * 0.75,
          child: PageView(
              onPageChanged: (i) => setState(() {
                    index = i;
                  }),
              scrollDirection: Axis.horizontal,
              children: [
                OnBoardingItem(
                  height: height,
                  backgroundColor: Color(0xff93B8FE),
                  imagePth: "assets/images/doc1.png",
                  index: index,
                  discription:
                      'You can easily contact with a thousands of doctors and contacrt for youe needs',
                  title: 'Thousands of doctors',
                ),
                OnBoardingItem(
                  height: height,
                  backgroundColor: Color(0xffEDA1AB),
                  imagePth: "assets/images/doc3.png",
                  index: index,
                  title: 'chat with doctors',
                  discription:
                      'You can easily contact with a thousands of doctors and contacrt for youe needs',
                ),
                OnBoardingItem(
                  height: height,
                  backgroundColor: Color(0xFF00DABE),
                  imagePth: "assets/images/doc2 .png",
                  index: index,
                  title: 'Live talk with doctor',
                  discription:
                      'You can easily contact with a thousands of doctors and contacrt for youe needs',
                ),
              ]),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: height * 0.03),
          child: OutlinedButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen())),
              child: Text(
                'skip',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: kBlueColor),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: Size(width, 50),
                shape: const StadiumBorder(),
                side: const BorderSide(width: 2, color: kBlueColor),
              )),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              title: 'Sign up',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              ),
            )),
        SizedBox(height: height * 0.04),
      ],
    ));
  }
}
