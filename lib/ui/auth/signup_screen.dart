import 'package:flutter/material.dart';
import 'package:medx/ui/auth/signin_screen.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/inputs/custom_text_field.dart';
import 'package:medx/utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Profile Details', style: Theme.of(context).textTheme.headlineMedium),
        iconTheme: IconThemeData(color: kBlueColor),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.044, left: 24, right: 24),
        child: CustomButton(
          title: 'Next',
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen())),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
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
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 8),
                child: Text('full Name', style: Theme.of(context).textTheme.displaySmall),
              ),
              CustomTextField(hintText: 'Full Name'),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 8),
                child: Text('Email', style: Theme.of(context).textTheme.displaySmall),
              ),
              CustomTextField(hintText: 'Email'),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 8),
                child: Text('Gender', style: Theme.of(context).textTheme.displaySmall),
              ),
              DropdownButtonFormField<String>(
                style: Theme.of(context).textTheme.displaySmall,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 27, vertical: 11),
                  hintText: "male",
                  hintStyle: TextStyle(
                      color: Color(0xFFDADADA), fontSize: 18, fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Color(0xffDADADA), width: .6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: kBlueColor, width: .6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Color(0xffDADADA), width: .6),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: kRedColor, width: .4),
                  ),
                ),
                items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (o) {},
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 8),
                child: Text('Date of Birth', style: Theme.of(context).textTheme.displaySmall),
              ),
              CustomTextField(hintText: 'DD-MM-YY'),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 8),
                child: Text('Password', style: Theme.of(context).textTheme.displaySmall),
              ),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                suffixIcon: Icons.remove_red_eye,
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
