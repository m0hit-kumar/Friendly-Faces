import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final _auth = FirebaseAuth.instance;

  void sendMessage(String roomId, Map<String, dynamic> data) async {
    final user = _auth.currentUser?.uid;

    try {
      final collectionRef = FirebaseFirestore.instance.collection('chatRoom');
      final documentRef = collectionRef.doc(roomId).collection(roomId).doc();
      data["from"] = user;
      print(" 000000000000000 $data");
      await documentRef.set(data);

      print('Document created successfully.');
    } catch (e) {
      print('Error creating document: $e');
    }
  }
}
