import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/utils/shared.dart';

class DoctorMilestone extends StatelessWidget {
  const DoctorMilestone({
    super.key,
    required this.doctor,
    required this.color,
    required this.icon,
    required this.discription,
    required this.title,
  });

  final Doctor doctor;
  final Color color;
  final Icon icon;
  final String title, discription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.height * 0.13,
      height: context.height * 0.18,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        shadows: [
          BoxShadow(
            color: Color(0x0C6A769A),
            blurRadius: 25,
            offset: Offset(0, 10),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: context.height * 0.06,
            height: context.height * 0.08,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
              ),
            ),
            child: icon,
          ),
          gap(context),
          Text(title,
              style: context.textTheme.labelSmall
                  ?.copyWith(fontWeight: FontWeight.w700, fontSize: 17)),
          Text(discription, style: context.textTheme.titleSmall?.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
