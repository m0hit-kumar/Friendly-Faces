import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/constants/decoration.dart';
import 'package:friendly_faces/controller/database_controller.dart';
import 'package:friendly_faces/pages/auth/create_profile.dart';
import 'package:friendly_faces/pages/dashboard/chat_section.dart';
import 'package:friendly_faces/pages/dashboard/navbar.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final constants = Get.put(Constants());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser?.uid;
  final DecorationClass decoration = DecorationClass();
  final database = Get.put(DatabaseController());

  bool userExistiInDb = false;
  void userExist() async {
    var isExist = await database.userExist();
    setState(() {
      userExistiInDb = isExist;
    });
  }

  @override
  initState() {
    super.initState();
    userExist();
  }

  bool isDrawerOpen = false;
  double xOffset = 0;
  double yoffset = 0;
  @override
  Widget build(BuildContext context) {
    print("0000000000 $xOffset $isDrawerOpen");

    return SafeArea(
      child: Scaffold(
        body: userExistiInDb
            ? Stack(
                children: [
                  const Navbar(),
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      transform: Matrix4.translationValues(xOffset, yoffset, 0),
                      child: Container(
                        decoration: decoration.background,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Get.toNamed("findConnection");
                                      setState(() {
                                        isDrawerOpen =
                                            isDrawerOpen ? false : true;
                                        xOffset = isDrawerOpen ? 180 : 0;
                                        yoffset = isDrawerOpen ? 80 : 0;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    "Friendly Faces",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed("/createProfile");
                                    },
                                    child: const CircleAvatar(
                                      radius: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const ChatSection(),
                          ],
                        ),
                      ))
                ],
              )
            : const CreateProfile(),
      ),
    );
  }
}
