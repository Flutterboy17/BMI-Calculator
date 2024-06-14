import 'package:flutter/material.dart';

import '../Constants/app_constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: accentHexColor,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w300,
                color: hintHexColor.withOpacity(0.8))),
        style: const TextStyle(
            fontSize: 42, fontWeight: FontWeight.w300, color: accentHexColor));
  }
}
