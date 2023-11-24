import 'package:flutter/material.dart';
import 'package:medx/ui/auth/code_verification_screen.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Forgot Password', style: Theme.of(context).textTheme.headlineMedium)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            gap(context),
            Text(
              "Select which contact details should we use to reset your password",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            gap(context),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected1 = !isSelected1;
                  isSelected2 = false;
                });
              },
              child: Container(
                width: double.infinity,
                height: 128,
                padding: const EdgeInsets.all(24),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: isSelected1 ? kBlueColor : Color(0xFFEAEEF2)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                        color: Color(0x145A6CEA),
                        blurRadius: 50,
                        offset: Offset(12, 26),
                        spreadRadius: 0)
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: ShapeDecoration(
                        color: Color(0x192972FE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Icon(Icons.message, size: 32, color: kBlueColor),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('via SMS:', style: Theme.of(context).textTheme.labelSmall),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              '+6282******39',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            gap(context),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected1 = false;
                  isSelected2 = !isSelected2;
                });
              },
              child: Container(
                width: double.infinity,
                height: 128,
                padding: const EdgeInsets.all(24),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: isSelected2 ? kBlueColor : Color(0xFFEAEEF2)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                        color: Color(0x145A6CEA),
                        blurRadius: 50,
                        offset: Offset(12, 26),
                        spreadRadius: 0)
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: ShapeDecoration(
                        color: Color(0x192972FE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Icon(Icons.mail, size: 32, color: kBlueColor),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('via Email:', style: Theme.of(context).textTheme.labelSmall),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'ex***le@yourdomain.com',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'continue',
              enabled: isSelected1 || isSelected2,
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CodeVerificationScreen())),
            ),
            gap(context, MediaQuery.sizeOf(context).height * 0.048)
          ],
        ),
      ),
    );
  }
}
