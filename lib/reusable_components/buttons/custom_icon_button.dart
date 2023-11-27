import 'package:flutter/material.dart';
import 'package:medx/utils/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.iconSize = 24,
    this.iconColor,
  });
  final IconData icon;
  final void Function()? onTap;
  final Color? iconColor;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
          color: Color(0x192972FE),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          shadows: [
            BoxShadow(
                color: Color(0x145A6CEA), blurRadius: 50, offset: Offset(0, 0), spreadRadius: 0)
          ],
        ),
        child: IconButton(
            iconSize: iconSize,
            icon: Icon(icon),
            color: iconColor ?? kBlueColor,
            onPressed: onTap));
  }
}
