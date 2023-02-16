import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/controller/database_controller.dart';
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
  final database = Get.put(DatabaseController());
  late DateTime dob;
  String dobHolder = "1/01/2001";
  final _name = TextEditingController();
  final _email = TextEditingController();

  String proffesion = 'IT Proffesional';
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
                  "Create Profile Page",
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
                      controller: _name,
                      decoration: const InputDecoration(
                        hintText: "Tony Stark",
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
                      controller: _email,
                      decoration: const InputDecoration(
                        hintText: "friendlyfaces@gmail.com",
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
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      // print(pickedDate);
                      setState(() {
                        dob = pickedDate;
                        dobHolder = "${dob.day}/${dob.month}/${dob.year}";
                      });
                    } else {
                      // ignore: avoid_print
                      print("Date is not selected");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffa3b1c6),
                        ),
                        BoxShadow(
                          color: Color(0xffe0e5ec),
                          spreadRadius: -12.0,
                          blurRadius: 12.0,
                        ),
                      ],
                      color: constants.inputBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: constants.whiteBackground),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 15.0, bottom: 15),
                      child: Text(
                        dobHolder,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 19, 19, 19)),
                        textAlign: TextAlign.left,
                      ),
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
                  height: Get.height / 17,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: constants.inputBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.46)),
                  ),
                  child: DropdownButton<String>(
                    value: proffesion,
                    onChanged: (String? newValue) {
                      setState(() {
                        proffesion = newValue!;
                      });
                    },
                    items: <String>[
                      'IT Proffesional',
                      'Traveller',
                      'Student',
                      'Other'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                const SizedBox(height: 100.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back(canPop: true);
                      },
                      child: Container(
                        decoration: BoxDecoration(
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
                      onTap: () {
                        // ignore: avoid_print
                        print(
                            "0000000000000 ${_email.text} ${_name.text} $dob");

                        database.createProfile(
                            _name.text, _email.text, dob, proffesion);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 53, 52, 52),
                                blurRadius: 2.0,
                                spreadRadius: 0.3)
                          ],
                          color: constants.whiteBackground,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        width: Get.width / 3,
                        height: 50,
                        child: const Center(
                          child: Text("Submit",
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
