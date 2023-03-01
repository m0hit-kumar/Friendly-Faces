import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/constants/decoration.dart';
import 'package:friendly_faces/controller/database_controller.dart';
import 'package:friendly_faces/pages/auth/create_profile.dart';
import 'package:friendly_faces/pages/dashboard/chatpage.dart';
import 'package:friendly_faces/pages/dashboard/home_starter.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.amber,
          body: userExistiInDb
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  decoration: decoration.background,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.menu,
                              color: Colors.white,
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
                      Expanded(
                        child: StreamBuilder<Object>(
                            stream: _firestore
                                .collection('users')
                                .doc(user)
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              Map<String, dynamic>? data =
                                  snapshot.data?.data();
                              print(
                                  "00000000000000 ${data == null ? "empty" : "is not empty"}");
                              if (snapshot.hasData) {
                                List<dynamic> connectedConnections =
                                    data!["chattingWith"];
                                print("00000000000 $connectedConnections");
                                return connectedConnections != []
                                    ? Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                        child: ListView.builder(
                                          itemCount:
                                              connectedConnections.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    print(
                                                        "00000000 ${connectedConnections[index]}");
                                                    Get.dialog(
                                                      ChatPage(
                                                          roomId:
                                                              connectedConnections[
                                                                  index]),
                                                      barrierDismissible: false,
                                                    );
                                                  },
                                                  child: const ListTile(
                                                      leading: CircleAvatar(
                                                        radius: 25,
                                                      ),
                                                      title: Text("nknk"),
                                                      subtitle: Text("jkjk"),
                                                      trailing: Text("ddd")),
                                                ),
                                                const Divider()
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    : const HomePageStarter();
                              } else {
                                return const Text('Document does not exist');
                              }
                            }),
                      ),
                    ],
                  ),
                )
              : const CreateProfile()),
    );
  }
}
