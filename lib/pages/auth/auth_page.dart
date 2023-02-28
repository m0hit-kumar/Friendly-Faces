import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/constants/decoration.dart';
import 'package:friendly_faces/controller/signup_controller.dart';
import 'package:friendly_faces/widgets/custom_button.dart';
import 'package:friendly_faces/widgets/input_widget.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final constants = Get.put(Constants());
  final authController = Get.put(SignUpController());
  TextEditingController phone = TextEditingController();
  final DecorationClass decoration = DecorationClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: decoration.background,
        child: Column(children: [
          SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 30.0),
              child: SizedBox(
                width: Get.width,
                height: Get.height / 2,
                child: Stack(children: [
                  Positioned(
                    left: 0,
                    top: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SizedBox(
                      height: 300,
                      child: Expanded(
                        child: Image.asset('assets/images/login_img.png'),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ]),
      ),
      bottomSheet: Wrap(children: [
        Container(
          decoration: BoxDecoration(
            color: constants.whiteBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 30.0, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Enter your \nmobile number",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Will send a OTP on your number",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                InputWidget(
                  constants: constants,
                  controller: phone,
                  hintText: '9876543210',
                  isObscrue: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 15.0),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 12, color: constants.centerLeftColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      constants: constants,
                      height: Get.height * 0.06,
                      onTap: () {
                        authController.phoneAuthentication(phone.text.trim());
                      },
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
          ),
        ),
      ]),
    );
  }
}
