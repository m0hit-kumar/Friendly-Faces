import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friendly_faces/controller/signup_controller.dart';
import 'package:get/get.dart';

class DatabaseController extends ConcreteGetxController {
  static get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference chatRooms =
      FirebaseFirestore.instance.collection('chatRoom');

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
        .update(createProfile)
        .then((value) =>
            // ignore: avoid_print
            {print("000000000000 Profile Created"), Get.toNamed("/homePage")})
        .catchError(
            // ignore: avoid_print, invalid_return_type_for_catch_error
            (error) => print("000000000000Failed to Create user: $error"));
  }

  Future<void> setLocationAndPreference(lat, long, preference) async {
    final user = _auth.currentUser?.uid;

    return users
        .doc(user)
        .update({
          "preference": preference,
          'loc': {'lat': lat, 'lon': long},
        })
        .then((value) => print("LocationAndPreference Set"))
        .catchError((error) =>
            print("Failed to add/update setLocationAndPreference: $error"));
  }

  Future<void> sendRequest(userid) async {
    final user = _auth.currentUser?.uid;
    List<String> oldRequestList = [];
    var data = await getRequests(userid);
    oldRequestList = data;
    oldRequestList.add(user!);
    return users
        .doc(userid)
        .update({"requests": oldRequestList})
        // ignore: avoid_print
        .then((value) => print("LocationAndPreference Set"))
        .catchError((error) =>
            print("Failed to add/update setLocationAndPreference: $error"));
  }

  Future<List<String>> getRequests(String userid) async {
    DocumentReference documentReference = users.doc(userid);
    List<String> result = [];
    DocumentSnapshot documentSnapshot = await documentReference.get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        print("000000000000000 Document data: $data");
        result = (data["requests"] as List<dynamic>).cast<String>();
        return result;
      } else {
        print("00000000000000 Data request downst exist or is null");
        return result;
      }
    } else {
      print("Document does not exist");
      return result;
    }
  }

  Future<String> createDocument(String groupChatId) async {
    try {
      DocumentReference documentReference =
          chatRooms.doc(groupChatId).collection(groupChatId).doc();

      await documentReference.set({
        'from': 'FriendlyFaces',
        'msg':
            'Hello Friend, thank you for using our platform to connect with potential hosts. We hope you find the perfect accommodation for your needs. If you have any questions or concerns, feel free to reach out to our support team.',
        'time': DateTime.now(),
      });
      print(
          '0000000000000000000000 Document created with ID: ${documentReference.id}');
      return documentReference.id;
    } catch (e) {
      print('00000000000000000 Error creating document: $e');
      return "";
    }
  }

  Future<void> updateChattingWith(
      String currentUserId, String otherUserId) async {
    String groupChatId;
    if (currentUserId.hashCode <= otherUserId.hashCode) {
      groupChatId = '$currentUserId-$otherUserId';
    } else {
      groupChatId = '$otherUserId-$currentUserId';
    }
    Future<String> chatRoom = createDocument(groupChatId);
    // Update the current user's document
    DocumentReference currentUserRef = users.doc(currentUserId);
    DocumentSnapshot currentUserSnapshot = await currentUserRef.get();
    if (currentUserSnapshot.exists) {
      Map<String, dynamic>? data =
          currentUserSnapshot.data() as Map<String, dynamic>?;
      var requestList = data!["requests"];
      // var chattingWith = data["chattingWith"];
      // chattingWith.add(chatRoom);

      requestList.remove(otherUserId);
      await currentUserRef.update({'requests': requestList});
    }

    // Update the other user's document
    DocumentReference otherUserRef = users.doc(otherUserId);
    DocumentSnapshot otherUserSnapshot = await otherUserRef.get();
    if (otherUserSnapshot.exists) {
      Map<String, dynamic>? data =
          otherUserSnapshot.data() as Map<String, dynamic>?;
      var requestList = data!["requests"];
      // var chattingWith = data["chattingWith"];
      // chattingWith.add(chatRoom);
      requestList.remove(currentUserId);
      await currentUserRef.update({'requests': requestList});
    }
  }

  Future<Map<String, dynamic>> getUser() async {
    final user = _auth.currentUser?.uid;

    DocumentReference documentReference = users.doc(user);

    DocumentSnapshot documentSnapshot = await documentReference.get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        print("Document data: $data");
        return data;
      } else {
        print("Data is null");
      }
    } else {
      print("Document does not exist");
    }

    return {"res": "no data"};
  }

  Future<List<String>> findConnections() async {
    final user = _auth.currentUser?.uid;
    List<String> result = [];

    QuerySnapshot querySnapshot =
        await users.where('preference', isEqualTo: 'room').get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      result.add(documentSnapshot.id);
    }
    result.removeWhere((item) => item == user);

    print("000000000000000 result $result");
    return result;
  }
}
