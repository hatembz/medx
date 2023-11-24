import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medx/ui/auth/reset_password_screen.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/widgets/loading_dialog.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:pinput/pinput.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final _codeFocusNode = FocusNode();
  final _codeController = TextEditingController();
  int timeLeft = 0;
  bool buttonEnabled = false;
  bool pinInvalid = false;
  String submitedPin = '';
  void CalculateTimeLeft() {
    setState(() {
      timeLeft = 60;
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft < 1)
        timer.cancel();
      else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    CalculateTimeLeft();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Forgot Password', style: Theme.of(context).textTheme.headlineMedium)),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 24, vertical: MediaQuery.sizeOf(context).height * 0.045),
          child: CustomButton(
            title: 'Verify',
            enabled: buttonEnabled,
            onTap: () async {
              await showDialog(context: context, builder: (context) => LoadingDialog());
              if (submitedPin != '4747') {
                setState(() => pinInvalid = true);
              } else
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Code has been send to + 213 ********* 4725',
                  style: Theme.of(context).textTheme.displaySmall),
              gap(context),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Pinput(
                  length: 4,
                  onClipboardFound: (value) {},
                  onCompleted: (String pin) {
                    setState(() {
                      buttonEnabled = true;
                      submitedPin = pin;
                    });
                  },
                  onChanged: (pin) {
                    setState(() {
                      buttonEnabled = pin.length == 4 ? true : false;
                      submitedPin = pin;
                      pinInvalid = false;
                    });
                  },
                  onSubmitted: (String pin) async {},
                  focusNode: _codeFocusNode,
                  controller: _codeController,
                  autofocus: true,
                  submittedPinTheme: pinPutDecoration.copyWith(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      decoration: pinPutDecoration.decoration?.copyWith(
                        border: Border.all(width: 2, color: pinInvalid ? kRedColor : kBlueColor),
                      )),
                  defaultPinTheme: pinPutDecoration,
                  followingPinTheme: pinPutDecoration,
                  disabledPinTheme: pinPutDecoration,
                  errorPinTheme: pinPutDecoration.copyDecorationWith(
                      border: Border.all(width: 2, color: kRedColor)),
                ),
              ),
              Visibility(
                visible: pinInvalid,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  margin: EdgeInsets.only(top: 14, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFFEEFEF), borderRadius: BorderRadius.circular(30)),
                  child: Row(children: [
                    Icon(Icons.warning, size: 17, color: kRedColor),
                    SizedBox(width: 10),
                    Text('invalid verification code',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: kRedColor))
                  ]),
                ),
              ),
              gap(context),
              timeLeft == 0
                  ? TextButton(
                      onPressed: () {},
                      child: Text('resend code',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(color: kBlueColor)),
                    )
                  : RichText(
                      text: TextSpan(children: [
                      TextSpan(
                          text: "Resend code in ", style: Theme.of(context).textTheme.displaySmall),
                      TextSpan(
                          text: "$timeLeft",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(color: kBlueColor)),
                      TextSpan(text: " s", style: Theme.of(context).textTheme.displaySmall),
                    ])),
            ],
          ),
        ));
  }
}
