import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final constants = Get.put(Constants());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [constants.centerLeftColor, constants.centerRightColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: Center(child: Text("Homepage"))),
    );
  }
}
