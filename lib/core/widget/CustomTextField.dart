// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Color? color;
  final String hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool readOnly;

   CustomTextField({
    Key? key,
    this.color,
    required this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly=false,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly:readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color!),
        ),
      ),
    );
  }
}
