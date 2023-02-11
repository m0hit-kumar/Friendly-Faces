import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.constants,
    required this.title,
    required this.onTap,
    required this.width,
    required this.height,
  });

  final Constants constants;
  final String title;
  final double width;
  final double height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            // color: constants.themeColor,
            gradient: LinearGradient(
                colors: [constants.centerLeftColor, constants.centerRightColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(title,
              style: TextStyle(color: constants.whiteTextColor, fontSize: 18)),
        ),
      ),
    );
  }
}
