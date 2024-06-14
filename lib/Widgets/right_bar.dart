import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/Constants/app_constants.dart';

class RightBar extends StatelessWidget {
  const RightBar({super.key, required this.barWidth});
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(28),
                  bottomRight: Radius.circular(28)),
              color: accentHexColor),
        )
      ],
    );
  }
}
