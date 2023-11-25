import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/utils/constants.dart';

class ProfileItemCard extends StatelessWidget {
  const ProfileItemCard({
    super.key,
    required this.title,
    required this.icon,
    this.isLogout = false,
    this.ontap,
  });
  final String title;
  final IconData icon;
  final bool isLogout;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.all(context.height * 0.01),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: ShapeDecoration(
                  color: isLogout ? Color(0xFFFFE8ED) : kdarkblue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: Icon(icon, size: 24, color: isLogout ? kRedColor : kBlueColor),
            ),
            const SizedBox(width: 20),
            Text(title, style: context.textTheme.bodyMedium),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: isLogout ? kRedColor : kBlueColor)
          ],
        ),
      ),
    );
  }
}
