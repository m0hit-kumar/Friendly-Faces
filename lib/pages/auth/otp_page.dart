import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class AdminOTPScreen extends StatefulWidget {
  const AdminOTPScreen({super.key});

  @override
  State<AdminOTPScreen> createState() => _AdminOTPScreenState();
}

class _AdminOTPScreenState extends State<AdminOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _otp = {
    'pin1': TextEditingController(),
    'pin2': TextEditingController(),
    'pin3': TextEditingController(),
    'pin4': TextEditingController(),
  };

  final constants = Get.put(Constants());
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [constants.centerLeftColor, constants.centerRightColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification Page",
                  style: TextStyle(
                      fontSize: 30,
                      color: constants.whiteBackground,
                      fontWeight: FontWeight.w700),
                ),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            spreadRadius: 0.2)
                      ],
                    ),
                    height: 300,
                    child: CircleAvatar(
                      backgroundColor: const Color(0xffe0e5ec),
                      radius: 80,
                      child: SvgPicture.asset(
                        width: 100,
                        height: 100,
                        'assets/images/email.svg',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "OTP sent!\n On your number +91 9876543210",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: constants.whiteBackground,
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffa3b1c6), // darker color
                            ),
                            BoxShadow(
                              color: Color(0xffe0e5ec), // background color
                              spreadRadius: -12.0,
                              blurRadius: 12.0,
                            ),
                          ],
                          color: constants.inputBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: constants.whiteBackground),
                        ),
                        width: 60,
                        height: 56,
                        child: TextFormField(
                          controller: _otp["pin1"],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                          ),
                          autofocus: false,
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffa3b1c6), // darker color
                            ),
                            BoxShadow(
                              color: Color(0xffe0e5ec), // background color
                              spreadRadius: -12.0,
                              blurRadius: 12.0,
                            ),
                          ],
                          color: constants.inputBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: constants.whiteBackground),
                        ),
                        width: 60,
                        height: 56,
                        child: TextFormField(
                          controller: _otp["pin2"],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                          ),
                          autofocus: false,
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffa3b1c6), // darker color
                            ),
                            BoxShadow(
                              color: Color(0xffe0e5ec), // background color
                              spreadRadius: -12.0,
                              blurRadius: 12.0,
                            ),
                          ],
                          color: constants.inputBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: constants.whiteBackground),
                        ),
                        width: 60,
                        height: 56,
                        child: TextFormField(
                          controller: _otp["pin3"],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                          ),
                          autofocus: false,
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffa3b1c6), // darker color
                            ),
                            BoxShadow(
                              color: Color(0xffe0e5ec), // background color
                              spreadRadius: -12.0,
                              blurRadius: 12.0,
                            ),
                          ],
                          color: constants.inputBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: constants.whiteBackground),
                        ),
                        width: 60,
                        height: 56,
                        child: TextFormField(
                          controller: _otp["pin4"],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                          ),
                          autofocus: false,
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 4,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shadowColor: Colors.black,
                      elevation: 8.0,
                      backgroundColor: const Color.fromARGB(255, 234, 238, 243),
                    ),
                    onPressed: () {
                      // ignore: avoid_print
                      print("0000000 ${_otp["pin1"]?.text}");
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 45.0, right: 45.0, top: 8.0, bottom: 8.0),
                      child:
                          Text("Verify", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
