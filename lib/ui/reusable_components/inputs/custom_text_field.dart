import 'package:flutter/material.dart';
import 'package:medx/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    // this.texteditingController,
    this.validator,
    this.onchanged,
    this.onSubmit,
    this.prefix,
    this.suffix,
    // this.suffix,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    // this.backgroundcolor = kcBackgroundColor,
    this.maxLines,
  }) : super(key: key);
  // final TextEditingController? texteditingController;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSubmit;
  final Function(String?)? onchanged;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputAction? textInputAction;

  final TextInputType? keyboardType;

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  // final Color? backgroundcolor;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFDADADA)),
          borderRadius: BorderRadius.circular(32),
        ),
        shadows: [
          BoxShadow(
              color: Color(0x196A769A), blurRadius: 35, offset: Offset(0, 19), spreadRadius: 0)
        ],
      ),
      child: TextFormField(
        cursorColor: kBlueColor,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText!,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 27, vertical: 11),
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFDADADA), fontSize: 18, fontWeight: FontWeight.w400),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(color: Color(0xffDADADA), width: .6),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(color: kBlueColor, width: .6),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Color(0xffDADADA), width: .6),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: kRedColor, width: .4),
          ),
          prefixIcon: prefix != null
              ? prefix
              : prefixIcon == null
                  ? null
                  : Icon(
                      prefixIcon,
                      color: Color(0xffDADADA),
                      // size: pSh(context: context, percentage: .025),
                    ),
          suffixIcon: suffix != null
              ? suffix
              : suffixIcon == null
                  ? null
                  : Icon(
                      suffixIcon,
                      color: Color(0xffDADADA),
                      // size: pSh(context: context, percentage: .025),
                    ),
        ),
        validator: validator,
        onChanged: onchanged,
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}
