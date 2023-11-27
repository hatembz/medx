import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalSpecialtyDetailed extends StatelessWidget {
  const MedicalSpecialtyDetailed({
    Key? key,
    this.onTap,
    required this.icon,
    required this.title,
    required this.discription,
    required this.backgroundColor,
  }) : super(key: key);
  final void Function()? onTap;
  final IconData icon;
  final String title, discription;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: context.height * 0.2,
            height: context.height * 0.2,
            decoration: ShapeDecoration(
                color: backgroundColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 48),
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
                Text(
                  title,
                  style: context.textTheme.labelSmall
                      ?.copyWith(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                'assets/images/corner_big.png',
                color: Color(0xFFFFFFFF),
              )),
        ],
      ),
    );
  }
}
