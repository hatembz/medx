import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/utils/constants.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.height,
    required this.index,
    required this.backgroundColor,
    required this.imagePth,
    required this.title,
    required this.discription,
  });
  final int index;
  final Color backgroundColor;
  final String imagePth;
  final String title;
  final String discription;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 0.5,
          width: context.width,
          color: backgroundColor,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [Image.asset(imagePth, height: height * 0.4)],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.01, top: height * 0.04),
          child: Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(color: kBlueColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: height * 0.01),
          child: Text(
            discription,
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(maxRadius: 3, backgroundColor: index == 0 ? kBlueColor : null),
              SizedBox(width: 8),
              CircleAvatar(maxRadius: 3, backgroundColor: index == 1 ? kBlueColor : null),
              SizedBox(width: 8),
              CircleAvatar(maxRadius: 3, backgroundColor: index == 2 ? kBlueColor : null)
            ],
          ),
        ),
      ],
    );
  }
}
