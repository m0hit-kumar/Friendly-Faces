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
  final DecorationClass decoration = DecorationClass();
  final database = Get.put(DatabaseController());

  bool userExistiInDb = false;
  late String userAvatar = "one";
  void userExist() async {
    var isExist = await database.userExist();
    var user = await database.getUser();
    print("0000000000000001 ${user["profile"]}");
    setState(() {
      userExistiInDb = isExist;
      userAvatar = user["profile"];
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
    print("0000000000 $xOffset $isDrawerOpen $userAvatar");

    return SafeArea(
      child: Scaffold(
        body: userExistiInDb
            ? Stack(
                children: [
                  const Navbar(),
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
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
                                      setState(() {
                                        isDrawerOpen =
                                            isDrawerOpen ? false : true;
                                        xOffset = isDrawerOpen ? 180 : 0;
                                        yoffset = isDrawerOpen ? 80 : 0;
                                      });
                                    },
                                    child: Icon(
                                      isDrawerOpen
                                          ? Icons.north_west
                                          : Icons.menu,
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
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      backgroundImage: AssetImage(
                                          "assets/images/$userAvatar.jpg"),
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
