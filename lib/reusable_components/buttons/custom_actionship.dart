import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/utils/constants.dart';

class CustomActionship extends StatelessWidget {
  const CustomActionship({
    super.key,
    required this.title,
    this.icon,
    this.enabled = true,
    required this.selected,
    this.ontap,
  });
  final String title;
  final IconData? icon;
  final bool enabled;
  final bool selected;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      color: MaterialStatePropertyAll(selected ? kBlueColor : Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      labelStyle: context.textTheme.labelMedium?.copyWith(color: Colors.white),
      backgroundColor: kBlueColor,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02, vertical: 8),
      surfaceTintColor: kBlueColor,
      disabledColor: Color(0xFF93B8FE),
      onPressed: enabled ? ontap : null,
      avatar: icon == null ? null : Icon(icon, color: selected ? Colors.white : kBlueColor),
      side: BorderSide(width: 2, color: enabled ? kBlueColor : Color(0xFF93B8FE)),
      label: Text(title,
          style:
              context.textTheme.labelMedium?.copyWith(color: selected ? Colors.white : kBlueColor)),
    );
  }
}
