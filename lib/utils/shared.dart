import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/widgets/medical_specialty_item.dart';
import 'package:medx/utils/svg_icons.dart';
import 'package:pinput/pinput.dart';

Widget gap(BuildContext context, [double? height]) {
  return SizedBox(height: height ?? context.height * 0.024);
}

PinTheme get pinPutDecoration {
  return PinTheme(
    height: 80,
    width: 80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Color(0x145A6CEA),
            blurRadius: 50,
            offset: Offset(12, 26),
            spreadRadius: 0,
          )
        ],
        border: Border.all(width: 2, color: Color(0xFFEAEEF2))),
  );
}

List<Widget> medicalSpecialties = [
  MedicalSpecialtyItem(
      icon: MedxIcons.consultation,
      backgroundColor: Color(0xFF4485FD),
      secondaryColor: Color(0xFF6299FF),
      title: 'Consultation'),
  MedicalSpecialtyItem(
      icon: MedxIcons.teeth,
      backgroundColor: Color(0xFFA584FF),
      secondaryColor: Color(0xFFB69CFF),
      title: 'Dental'),
  MedicalSpecialtyItem(
      icon: MedxIcons.heart_1,
      backgroundColor: Color(0xFFFF7854),
      secondaryColor: Color(0xFFFFA187),
      title: 'Heart'),
  MedicalSpecialtyItem(
      icon: MedxIcons.clinic,
      backgroundColor: Color(0xFFFDA625),
      secondaryColor: Color(0xFFFFB547),
      title: 'Hospitals'),
  MedicalSpecialtyItem(
      icon: MedxIcons.medicine,
      backgroundColor: Color(0xFF00CC6A),
      secondaryColor: Color(0xFF19D37A),
      title: 'Medicines'),
  MedicalSpecialtyItem(
      icon: MedxIcons.care,
      backgroundColor: Color(0xFF00C9E4),
      secondaryColor: Color(0xFF05D1ED),
      title: 'Physician'),
  MedicalSpecialtyItem(
      icon: MedxIcons.bandage,
      backgroundColor: Color(0xFFFD44B3),
      secondaryColor: Color(0xFFFF71C6),
      title: 'Skin'),
  MedicalSpecialtyItem(
      icon: MedxIcons.syringe,
      backgroundColor: Color(0xFFFD4444),
      secondaryColor: Color(0xFFFF7070),
      title: 'Surgeon'),
];
