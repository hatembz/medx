import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalSpecialtyItem extends StatelessWidget {
  const MedicalSpecialtyItem(
      {super.key,
      required this.icon,
      required this.backgroundColor,
      required this.secondaryColor,
      this.onTap,
      required this.title});
  final IconData icon;
  final String title;
  final Color backgroundColor;
  final Color secondaryColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                width: context.height * 0.07,
                height: context.height * 0.07,
                decoration: ShapeDecoration(
                    color: backgroundColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                child: Icon(icon, color: Colors.white),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset('assets/images/corner.png', color: secondaryColor)),
            ],
          ),
        ),
        SizedBox(height: 3),
        Text(title, style: context.textTheme.titleSmall)
      ],
    );
  }
}
