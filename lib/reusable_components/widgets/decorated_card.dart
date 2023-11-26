import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.isOnline,
    required this.title,
    required this.specialty,
    required this.rating,
    required this.reviews,
    this.hasHeart = false,
  });

  final bool isOnline;
  final String title;
  final String specialty;
  final double rating;
  final int reviews;
  final bool hasHeart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.height * 0.2,
      height: context.height * 0.25,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, strokeAlign: BorderSide.strokeAlignCenter, color: Color(0xFFDADADA)),
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
                color: Color(0x0F000000), blurRadius: 60, offset: Offset(0, 10), spreadRadius: 0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!hasHeart)
            gap(context)
          else
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: kdarkblue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Icon(MedxIcons.heart, size: 15, color: kBlueColor)),
                ],
              ),
            ),
          Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/images/doc_image2.png',
                    height: 80, width: 80, fit: BoxFit.fill)),
            if (isOnline)
              Positioned(
                top: 0,
                right: 5,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kBlueColor,
                      border: Border.all(width: 3, color: Colors.white)),
                ),
              )
          ]),
          gap(context),
          Text(title, style: context.textTheme.displaySmall),
          Text(specialty, style: context.textTheme.titleSmall?.copyWith(color: Colors.grey)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Text("$rating ($reviews reviews)",
                  style: context.textTheme.titleSmall?.copyWith(color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
