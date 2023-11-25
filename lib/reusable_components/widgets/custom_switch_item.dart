import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSwitchItem extends StatelessWidget {
  const CustomSwitchItem({
    super.key,
    required this.title,
    required this.value,
    this.onchanged,
  });
  final String title;
  final bool value;
  final void Function(bool)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.height * 0.01),
      child: SwitchListTile(
        inactiveTrackColor: Colors.grey,
        inactiveThumbColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        title: Text(title, style: context.textTheme.bodyMedium),
        value: value,
        onChanged: onchanged,
      ),
    );
  }
}
