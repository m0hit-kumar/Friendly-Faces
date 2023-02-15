import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      required this.constants,
      required this.hintText,
      required this.controller,
      required this.isObscrue})
      : super(key: key);

  final Constants constants;
  final String hintText;
  final TextEditingController controller;
  final bool isObscrue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height / 17,
      decoration: BoxDecoration(
        color: constants.inputBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.46)),
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
