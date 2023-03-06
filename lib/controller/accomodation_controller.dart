import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:friendly_faces/controller/database_controller.dart';
import 'package:get/get.dart';

class AccomodationController extends GetxController {
  final _auth = FirebaseAuth.instance;
  CollectionReference accommodation =
      FirebaseFirestore.instance.collection('accommodation');

  Future<void> createAccommodation(
      String name, String about, File img, GeoPoint loc) async {
    final user = _auth.currentUser?.uid;
    var imgUrl = await uploadImageToFirebase(img, user!);
    final createAccommodation = {
      'name': name,
      'about': about,
      "loc": loc,
      'image': imgUrl,
    };
    accommodation
        .doc(user)
        .set(createAccommodation)
        .then((value) => {
              print("000000000000 accommodation Created"),
              Get.back(canPop: true)
            })
        .catchError(
            (error) => print("000000000000Failed to Create user: $error"));
  }

  Future<String?> uploadImageToFirebase(File file, String fileName) async {
    try {
      Reference reference =
          FirebaseStorage.instance.ref().child('accommodation/$fileName');

      await reference.putFile(file);

      String downloadUrl = await reference.getDownloadURL();
      print("000000000000000$downloadUrl");
      return downloadUrl;
    } catch (e) {
      print('00000000000000000Error uploading image to Firebase: $e');
      return null;
    }
  }

  final db = Get.put(DatabaseController());
  Future<List<String>> findAccommodation() async {
    final user = _auth.currentUser?.uid;
    List<String> result = [];
    Map<String, dynamic> profile = await db.getUser();
    print("0000000000000000 preference ${profile['loc']}");
    // QuerySnapshot querySnapshot =
    //     await users.where('preference', isEqualTo: profile['preference']).get();

    // for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
    //   result.add(documentSnapshot.id);
    // }
    // result.removeWhere((item) => item == user);

    print("000000000000000 result $result");
    return result;
  }
}
