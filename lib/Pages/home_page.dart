import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/Constants/app_constants.dart';
import 'package:flutter_bmi_calculator_app/Widgets/left_bar.dart';
import '../Widgets/custom_textfield.dart';
import '../Widgets/right_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double bmiResult = 0;
  String textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 20,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 80),
          child: Text(
            'BMI Calculator',
            style: TextStyle(
                color: accentHexColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 130,
                child: CustomTextfield(
                  controller: heightController,
                  hintText: "Height",
                ),
              ),
              SizedBox(
                width: 130,
                child: CustomTextfield(
                  controller: weightController,
                  hintText: "Weight",
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: calculateBMI,
            child: const Text(
              "Calculate",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor),
            ),
          ),
          Spacer(),
          Text(
            bmiResult.toStringAsFixed(2),
            style: const TextStyle(fontSize: 90, color: accentHexColor),
          ),
          Spacer(),
          Text(
            textResult,
            style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: accentHexColor),
          ),
          const SizedBox(height: 50),
          const LeftBar(barWidth: 40),
          const SizedBox(height: 16),
          const LeftBar(barWidth: 70),
          const SizedBox(height: 16),
          const LeftBar(barWidth: 40),
          const SizedBox(height: 16),
          const RightBar(barWidth: 40),
          const SizedBox(height: 16),
          const RightBar(barWidth: 80),
          Spacer(),
        ],
      ),
    );
  }

  void calculateBMI() {
    String heightStr = heightController.text.trim();
    String weightStr = weightController.text.trim();

    if (heightStr.isEmpty || weightStr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: accentHexColor,
            content: Text(
              "Please enter both height and weight",
              style: TextStyle(color: mainHexColor),
            )),
      );
    } else {
      // Convert height in feet to meters
      double h = double.parse(heightStr) * 0.3048; // Convert feet to meters
      double w = double.parse(weightStr);
      setState(() {
        bmiResult = w / (h * h);
        if (bmiResult > 25) {
          textResult = "You're overweight";
        } else if (bmiResult >= 18.5 && bmiResult <= 25) {
          textResult = "You have normal weight";
        } else {
          textResult = "You're underweight";
        }
      });
    }
  }
}
