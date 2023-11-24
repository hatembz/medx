import 'package:flutter/material.dart';

Widget gap(BuildContext context, [double? height]) {
  return SizedBox(height: height ?? MediaQuery.sizeOf(context).height * 0.024);
}
