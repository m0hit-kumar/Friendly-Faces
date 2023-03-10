import 'package:flutter/material.dart';
import 'package:friendly_faces/pages/dashboard/home_starter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/pages/dashboard/chatpage.dart';
import 'package:get/get.dart';

class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  final Mylist = [
    {"avatar": "one", "user": "Tony Stark", "msg": "hi", "time": "3:30pm"},
    {
      "avatar": "two",
      "user": "Sakshi",
      "msg": "how are you?",
      "time": "3:15pm"
    },
    {"avatar": "three", "user": "Nirajan", "msg": "hi", "time": "3:10pm"}
  ];

  final constants = Get.put(Constants());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    print("000000000000000 run");
    return Expanded(
      child: StreamBuilder<Object>(
          stream: _firestore.collection('users').doc(user).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            Map<String, dynamic>? data = snapshot.data?.data();
            print("00000000000000 ${data == null ? "empty" : "is not empty"}");
            if (snapshot.hasData) {
              List<dynamic> connectedConnections = data!["chattingWith"];
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
                        itemCount: connectedConnections.length,
                        itemBuilder: (context, index) {
                          final item = Mylist[index];
                          print("00000000000000000${item}");

                          final String image = item["avatar"] as String;
                          final String time = item["time"] as String;
                          final String user = item["user"] as String;
                          final String msg = item["msg"] as String;

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  print(
                                      "00000000 ${connectedConnections[index]}");
                                  Get.dialog(
                                    ChatPage(
                                        roomId: connectedConnections[index]),
                                    barrierDismissible: false,
                                  );
                                },
                                child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                          "assets/images/$image.jpg"),
                                    ),
                                    title: Text(user),
                                    subtitle: Text(msg),
                                    trailing: Text(time)),
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
    );
  }
}
