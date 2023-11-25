import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    required this.title,
    this.onTap,
    this.enabled = true,
  });

  final double? width;
  final bool enabled;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? context.width,
        height: 50,
        child: Center(
            child: Text(
          title,
          style: context.textTheme.labelMedium?.copyWith(color: Colors.white),
        )),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.71, 0.71),
            end: Alignment(0.71, -0.71),
            colors: enabled
                ? [Color(0xFF2972FE), Color(0xFF6399FF)]
                : [Color(0xFF2972FE).withOpacity(.4), Color(0xFF6399FF).withOpacity(.4)],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        // style: OutlinedButton.styleFrom(fixedSize: Size(width, 50),backgroundColor: )),
      ),
    );
  }
}
