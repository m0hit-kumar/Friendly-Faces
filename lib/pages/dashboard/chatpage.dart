import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/widgets/input_widget.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final constants = Get.put(Constants());
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE7F1EF),
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text("User"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                constants.centerLeftColor,
                constants.centerRightColor
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('chatRoom')
                    .doc("O7e3YQSq36zAMhDBOjDk")
                    .collection("O7e3YQSq36zAMhDBOjDk")
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
                        bool iamsender =
                            message["from"] == "user1" ? true : false;
                        return Align(
                            alignment: iamsender
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: iamsender
                                    ? const Color.fromARGB(255, 47, 125, 108)
                                    : const Color.fromARGB(255, 0, 180, 165),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                message["msg"],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ));
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
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  constants.centerLeftColor,
                  constants.centerRightColor
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
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
