import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medx/ui/auth/forgot_password.dart';
import 'package:medx/ui/auth/signup_screen.dart';
import 'package:medx/ui/reusable_components/buttons/custom_button.dart';
import 'package:medx/ui/reusable_components/inputs/custom_text_field.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/svg_icons.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isInvalidEmail = false;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 24, vertical: MediaQuery.sizeOf(context).height * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logoBlue.png', width: 100, height: 100),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.03),
                child: Text('Sign in', style: Theme.of(context).textTheme.titleMedium),
              ),
              if (!isInvalidEmail) SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, bottom: 8),
                    child: Text('Email', style: Theme.of(context).textTheme.displaySmall),
                  ),
                  CustomTextField(hintText: 'Email'),
                  Visibility(
                      visible: isInvalidEmail,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 30,
                        margin: EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                            color: Color(0xFFFEEFEF), borderRadius: BorderRadius.circular(30)),
                        child: Row(children: [
                          Icon(Icons.warning, size: 17, color: kRedColor),
                          SizedBox(width: 10),
                          Text('invalid email',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: kRedColor))
                        ]),
                      )),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, bottom: 8),
                    child: Text('Password', style: Theme.of(context).textTheme.displaySmall),
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    obscureText: true,
                    suffixIcon: Icons.remove_red_eye,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.02),
                child: CustomButton(
                  title: 'Sign in',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Center(
                            heightFactor: 40,
                            widthFactor: 40,
                            child: CircularProgressIndicator(
                              color: kBlueColor,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                },
                child: Text('Forget the Password ?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kBlueColor)),
              ),
              Text('or continue with', style: Theme.of(context).textTheme.bodyMedium),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.white,
                        shadowColor: Color(0x196A769A),
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFDADADA)),
                      ),
                      icon: Icon(MedxIcons.facebook, size: 32),
                      label: Text('Facebook', style: Theme.of(context).textTheme.bodyMedium),
                      onPressed: () {},
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.white,
                        shadowColor: Color(0x196A769A),
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFDADADA)),
                      ),
                      icon: Icon(MedxIcons.google, size: 32, color: kRedColor),
                      label: Text('Google', style: Theme.of(context).textTheme.bodyMedium),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account ?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Color(0xFF979797))),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                    child: Text('Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kBlueColor)),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
