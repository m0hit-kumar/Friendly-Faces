import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
              Get.toNamed("/accommodationPage")
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
}
