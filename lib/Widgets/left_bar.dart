import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/Constants/app_constants.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({super.key, required this.barWidth});
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  bottomLeft: Radius.circular(28)),
              color: accentHexColor),
        )
      ],
    );
  }
}
