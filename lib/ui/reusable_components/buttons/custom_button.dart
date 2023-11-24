import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    required this.title,
    this.onTap,
  });

  final double? width;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: 50,
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),
        )),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.71, 0.71),
            end: Alignment(0.71, -0.71),
            colors: [Color(0xFF2972FE), Color(0xFF6399FF)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        // style: OutlinedButton.styleFrom(fixedSize: Size(width, 50),backgroundColor: )),
      ),
    );
  }
}
