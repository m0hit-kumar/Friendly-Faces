import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final constants = Get.put(Constants());
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
            padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
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
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
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
                  // width: 60,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: " ",
                        border: InputBorder.none,
                      ),
                      autofocus: false,
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 19, 19, 19)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Email",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
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
                  // width: 60,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: " ",
                        border: InputBorder.none,
                      ),
                      autofocus: false,
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 19, 19, 19)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "DOB",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
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
                  // width: 60,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: " ",
                        border: InputBorder.none,
                      ),
                      autofocus: false,
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 19, 19, 19)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Proffesion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
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
                  // width: 60,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: " ",
                        border: InputBorder.none,
                      ),
                      autofocus: false,
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 19, 19, 19)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(height: 100.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          // color: constants.whiteBackground,
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        width: Get.width / 3,
                        height: 50,
                        child: const Center(
                          child: Text("Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 53, 52, 52), //New
                                blurRadius: 2.0,
                                spreadRadius: 0.3)
                          ],
                          color: constants.whiteBackground,
                          // border: Border.all(width: 2, color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        width: Get.width / 3,
                        height: 50,
                        child: const Center(
                          child: Text("Cancel",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
