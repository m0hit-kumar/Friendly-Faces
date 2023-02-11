import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      required this.constants,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.isObscrue})
      : super(key: key);

  final Constants constants;
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isObscrue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height / 17,
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(255, 199, 207, 205),
            offset: Offset(
              0.0,
              2.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ), //BoxShadow
          BoxShadow(
            color: constants.whiteBackground,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxSh
        ],
        color: constants.inputBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: constants.whiteBackground),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isObscrue,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              color: constants.inputHintTextColor,
              fontSize: 15,
              fontWeight: FontWeight.normal),
          contentPadding: const EdgeInsets.all(14),
        ),
      ),
    );
  }
}
