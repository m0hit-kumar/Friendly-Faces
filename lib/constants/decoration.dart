import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class DecorationClass extends GetxController {
  final constants = Get.put(Constants());
  late final BoxDecoration background;

  DecorationClass() {
    background = BoxDecoration(
      gradient: LinearGradient(
        colors: [constants.centerLeftColor, constants.centerRightColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    );
  }
}
