import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/widgets/custom_button.dart';
import 'package:friendly_faces/widgets/input_widget.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final constants = Get.put(Constants());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [constants.centerLeftColor, constants.centerRightColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Column(children: [
          SizedBox(
            width: Get.width,
            height: Get.height / 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Friendly Faces",
                      style: TextStyle(
                          fontSize: 41,
                          color: constants.whiteBackground,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Friend is just around the corner",
                      style: TextStyle(
                          fontSize: 15, color: constants.whiteBackground),
                    )
                  ]),
            ),
          ),
          Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: constants.whiteBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              height: Get.height * 3 / 4,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Mobile No.",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    InputWidget(
                      constants: constants,
                      controller: phoneController,
                      hintText: '',
                      isObscrue: false,
                      title: 'Mobile NO.',
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Mobile No.",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    InputWidget(
                      constants: constants,
                      controller: phoneController,
                      hintText: '',
                      isObscrue: false,
                      title: 'Mobile NO.',
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 15, color: constants.centerLeftColor),
                    ),
                    SizedBox(
                      height: Get.height * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          constants: constants,
                          height: Get.height * 0.06,
                          onTap: () {},
                          title: 'SignUp',
                          width: Get.width * 0.39,
                        ),
                        CustomButton(
                          constants: constants,
                          height: Get.height * 0.06,
                          onTap: () {},
                          title: 'Login',
                          width: Get.width * 0.39,
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
