import "package:firebase_auth/firebase_auth.dart";
import "package:friendly_faces/pages/auth/otp_page.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

class AutenticationManager extends GetxController {
  static get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  static String verificationId = "";

  Future<void> checkPhoneNumber(String number) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        //  print(
        //     "------------------- verfication completed   $credential  $verificationId ");
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {}
        //  print("Error 00000000000000000 ${e.message}");
      },
      codeSent: (String verifyid, int? resendToken) {
        AutenticationManager.verificationId = verifyid;
        // print("------------------- co/desent  $verificationId ");
        Get.offAll(const AdminOTPScreen());
      },
      codeAutoRetrievalTimeout: (String verifyid) {
        AutenticationManager.verificationId = verifyid;
        // print("------------------- codeAutoRetrievalTimeout $verificationId ");
      },
    );

    // print("---------------------------- out $verificationId");
  }

  Future<bool> verifyOTP(String otp) async {
    // print("xxxxxxxxxxxxxxxxxx $otp");

    // print("------------------------- $verificationId");
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (credential.user != null) {
      await prefs.setBool('isloggedIn', true);
    }

    return credential.user != null ? true : false;
  }
}
