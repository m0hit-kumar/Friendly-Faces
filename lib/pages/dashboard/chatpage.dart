import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/constants/decoration.dart';
import 'package:friendly_faces/controller/chat_controller.dart';
import 'package:friendly_faces/widgets/input_widget.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  final String roomId;
  const ChatPage({super.key, required this.roomId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final constants = Get.put(Constants());
  final chatController = Get.put(ChatController());
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final DecorationClass decoration = DecorationClass();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE7F1EF),
        appBar: AppBar(
          actions: [],
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
          title: const Text("User"),
          flexibleSpace: Container(decoration: decoration.background),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('chatRoom')
                    .doc(widget.roomId)
                    .collection(widget.roomId)
                    .orderBy('time', descending: true)
                    .snapshots(), // Replace 'messages' with your collection name
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print("000000000000000 no data");
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                    ));
                  } else {
                    List<QueryDocumentSnapshot> listMessage =
                        snapshot.data!.docs;

                    return ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemBuilder: (context, index) {
                        var message = listMessage[index].data();
                        Map<String, dynamic> item =
                            message as Map<String, dynamic>;

                        print("00000000000000 message ${message["msg"]}");
                        final user = _auth.currentUser?.uid;

                        bool iamsender = message["from"] == user ? true : false;
                        return Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Align(
                              alignment: iamsender
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: iamsender
                                      ? const Color.fromARGB(255, 47, 125, 108)
                                      : const Color.fromARGB(255, 0, 180, 165),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    message["msg"],
                                    // textAlign: TextAlign.justify,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )),
                        );
                      },
                      itemCount: listMessage.length,
                      reverse: true,
                      // controller: listScrollController,
                    );
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 80.0,
              decoration: decoration.background,
              child: Row(
                children: [
                  Expanded(
                      child: InputWidget(
                    constants: constants,
                    controller: _messageController,
                    hintText: 'Type your message',
                    isObscrue: false,
                  )),
                  IconButton(
                    onPressed: () {
                      // send message

                      if (_messageController.text.trim().isNotEmpty) {
                        Map<String, dynamic> data = {
                          "msg": _messageController.text.trim(),
                          "time":
                              DateTime.now().millisecondsSinceEpoch.toString(),
                        };
                        chatController.sendMessage(widget.roomId, data);

                        setState(() {
                          _messageController.text = "";
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
