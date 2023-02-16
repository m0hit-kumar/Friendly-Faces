import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friendly_faces/controller/signup_controller.dart';
import 'package:get/get.dart';

class DatabaseController extends ConcreteGetxController {
  static get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> createProfile(
      String name, String email, DateTime dob, String proffesion) async {
    final user = _auth.currentUser?.uid;
    // print("000000000000000000 $user");

    final createProfile = {
      'name': name,
      'email': email,
      'dob': {"date": dob.day, "month": dob.month, "year": dob.year},
      'proffesion': proffesion
    };

    users
        .doc(user)
        .set(createProfile)
        .then((value) =>
            // ignore: avoid_print
            {print("000000000000 Profile Created"), Get.toNamed("/homePage")})
        .catchError(
            // ignore: avoid_print, invalid_return_type_for_catch_error
            (error) => print("000000000000Failed to Create user: $error"));
  }
}
