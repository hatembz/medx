import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/ui/auth/sign_in/signin_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';

class LogoutMoalSheet extends StatelessWidget {
  const LogoutMoalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            MedxIcons.logout,
            size: 48,
            color: kBlueColor,
          ),
          gap(context),
          Text('Are you sure want to logout',
              textAlign: TextAlign.center, style: context.textTheme.bodyMedium),
          gap(context),
          gap(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(fixedSize: Size(context.width * 0.4, 55)),
                  child: Text('cancel')),
              CustomButton(
                title: 'Yes,Logout',
                width: context.width * 0.4,
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SigninScreen(),
                    ),
                    (route) => false),
              )
            ],
          )
        ],
      ),
    );
  }
}
