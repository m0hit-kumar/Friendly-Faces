import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friendly_faces/controller/database_controller.dart';
import 'package:get/get.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

final geo = GeoFlutterFire();
final _firestore = FirebaseFirestore.instance;

class AccomodationController extends GetxController {
  final _auth = FirebaseAuth.instance;
  CollectionReference accommodation =
      FirebaseFirestore.instance.collection('accommodation');

  Future<void> createAccommodation(
      String name, String about, File img, GeoPoint loc) async {
    final user = _auth.currentUser?.uid;

    var imgUrl = await uploadImageToFirebase(img, user!);
    GeoFirePoint myLocation =
        geo.point(latitude: loc.latitude, longitude: loc.longitude);
    final createAccommodation = {
      'name': name,
      'about': about,
      "loc": myLocation.data,
      'image': imgUrl,
      'uid': user
    };
    accommodation
        .doc(user)
        // .doc("AsMBy61nhjQRd4QvgCmjz0Y1KNS10")
        .set(createAccommodation)
        .then((value) => {
              print("000000000000 accommodation Created"),
              Fluttertoast.showToast(
                msg: 'Accommodation created',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
              ),
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
    QuerySnapshot querySnapshot = await accommodation.get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      result.add(documentSnapshot.id);
    }
    result.removeWhere((item) => item == user);

    print("000000000000000 result $result");
    return result;
  }

  Future<void> deleteAccomodation() async {
    final user = _auth.currentUser?.uid;
    try {
      await accommodation.doc(user).delete();
      print('000000000 Document $user deleted successfully.');
      Fluttertoast.showToast(
        msg: 'Your accommodation request has been removed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
    } catch (e) {
      print('000000000 Error deleting document: $e');
    }
  }
}
