import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/ui/auth/sign_in/signin_screen.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/inputs/custom_text_field.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  bool ishidden = true;
  IconData icon = Icons.remove_red_eye;
  String gender = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Profile Details', style: context.textTheme.headlineMedium),
        iconTheme: IconThemeData(color: kBlueColor),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: context.height * 0.044, left: 24, right: 24),
        child: CustomButton(
          title: 'Next',
          onTap: () {
            if ((_formkey.currentState?.validate() ?? false) && gender != '')
              Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap(context),
                Center(
                  child: Container(
                    height: 110,
                    width: 110,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFD7D7D7).withOpacity(0.4),
                      child: Icon(Icons.person, color: Colors.grey, size: 48),
                    ),
                  ),
                ),
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('full Name', style: context.textTheme.displaySmall),
                ),
                CustomTextField(
                    hintText: 'Full Name',
                    controller: nameController,
                    validator: (value) {
                      if (nameController.text == '' || nameController.text.length < 3)
                        return 'enter name';
                      return null;
                    }),
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('Email', style: context.textTheme.displaySmall),
                ),
                CustomTextField(
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (emailController.text == '' || !emailController.text.isEmail)
                        return 'inter valid email';
                      return null;
                    }),

                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('Gender', style: context.textTheme.displaySmall),
                ),
                DropdownButtonFormField<String>(
                  style: context.textTheme.displaySmall,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                    hintText: "male",
                    hintStyle: TextStyle(
                        color: Color(0xFFDADADA), fontSize: 18, fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Color(0xffDADADA), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: kBlueColor, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Color(0xffDADADA), width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: kRedColor, width: 2)),
                  ),
                  items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      enabled: true,
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => gender = value ?? ''),
                ),
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('Date of Birth', style: context.textTheme.displaySmall),
                ),
                CustomTextField(
                  hintText: 'DD-MM-YY',
                  controller: dateController,
                  validator: (value) {
                    if (dateController.text.isEmpty) return 'Invalid Date';
                    return null;
                  },
                ),
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('Password', style: context.textTheme.displaySmall),
                ),
                CustomTextField(
                  hintText: 'Password',
                  obscureText: ishidden,
                  controller: passwordController,
                  validator: (p0) {
                    if (passwordController.text.length <= 6 || passwordController.text.length == 0)
                      return 'enter valid password';
                    return null;
                  },
                  onIconTaped: () {
                    setState(() {
                      ishidden = !ishidden;
                      icon = ishidden ? Icons.visibility : Icons.visibility_off;
                    });
                  },
                  suffixIcon: icon,
                ),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
