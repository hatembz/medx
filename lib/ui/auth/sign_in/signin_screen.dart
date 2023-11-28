import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/ui/auth/sign_in/forgot_password.dart';
import 'package:medx/ui/auth/signup_screen.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/inputs/custom_text_field.dart';
import 'package:medx/reusable_components/widgets/loading_dialog.dart';
import 'package:medx/ui/main_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/svg_icons.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool ishidden = true;
  IconData icon = Icons.remove_red_eye;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isInvalidEmail = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: context.height * 0.04),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/logoBlue.png', width: 100, height: 100),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
                  child: Text('Sign in', style: context.textTheme.titleMedium),
                ),
                if (!isInvalidEmail) SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14, bottom: 8),
                      child: Text('Email', style: context.textTheme.displaySmall),
                    ),
                    CustomTextField(
                        hintText: 'Email',
                        controller: emailController,
                        validator: (value) {
                          if (emailController.text == '' ||
                              !emailController.text.contains('gmail.com')) return '';
                          return null;
                        }),
                    Visibility(
                        visible: isInvalidEmail,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 30,
                          // margin: EdgeInsets.only(top: 14),
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
                    SizedBox(height: context.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, bottom: 8),
                      child: Text('Password', style: context.textTheme.displaySmall),
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      obscureText: ishidden,
                      controller: passwordController,
                      onIconTaped: () {
                        print('icon tapped');
                        setState(() {
                          ishidden = !ishidden;
                          icon = ishidden ? Icons.visibility : Icons.visibility_off;
                        });
                      },
                      suffixIcon: icon,
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
                  child: CustomButton(
                    title: 'Sign in',
                    onTap: () async {
                      await showDialog(context: context, builder: (context) => LoadingDialog());
                      if (_formkey.currentState?.validate() ?? false) {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => MainScreen()));
                      } else {
                        setState(() {
                          isInvalidEmail = true;
                        });
                      }
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                  },
                  child: Text('Forget the Password ?',
                      style: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)),
                ),
                Text('or continue with', style: context.textTheme.bodyMedium),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: Colors.white,
                          shadowColor: Color(0x196A769A),
                          fixedSize: Size(context.width * 0.4, 50),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFDADADA)),
                        ),
                        icon: Icon(MedxIcons.facebook, size: 32),
                        label: Text('Facebook', style: context.textTheme.bodyMedium),
                        onPressed: () {},
                      ),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: Colors.white,
                          shadowColor: Color(0x196A769A),
                          fixedSize: Size(context.width * 0.4, 50),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFDADADA)),
                        ),
                        icon: Icon(MedxIcons.google, size: 32, color: kRedColor),
                        label: Text('Google', style: context.textTheme.bodyMedium),
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
                          style: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
