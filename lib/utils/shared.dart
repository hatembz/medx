import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
