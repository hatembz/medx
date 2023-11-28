import 'package:flutter/material.dart';
import 'package:medx/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.validator,
    this.onchanged,
    this.onSubmit,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    // this.backgroundcolor = kcBackgroundColor,
    this.maxLines,
    this.controller,
    this.onIconTaped,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSubmit;
  final Function(String?)? onchanged;
  final void Function()? onIconTaped;
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        shadows: [BoxShadow(color: Color(0x196A769A), blurRadius: 35, offset: Offset(0, 19))],
      ),
      child: TextFormField(
        controller: controller,
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
            borderSide: const BorderSide(color: kBlueColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(color: kBlueColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: (controller?.text.isNotEmpty ?? false) ? kBlueColor : Color(0xffDADADA),
                width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: kRedColor, width: 2),
          ),
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, color: Color(0xffDADADA)),
          suffixIcon: suffixIcon == null
              ? null
              : IconButton(
                  onPressed: onIconTaped,
                  icon: Icon(
                    suffixIcon,
                    color: Color(0xffDADADA),
                  )),
        ),
        validator: validator,
        onChanged: onchanged,
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}
