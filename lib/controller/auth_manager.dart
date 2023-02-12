import "package:firebase_auth/firebase_auth.dart";
import "package:friendly_faces/pages/auth/dashboard/homepage.dart";
import "package:friendly_faces/pages/auth/otp_page.dart";
import "package:get/get.dart";

class AutenticationManager extends GetxController {
  static get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  var verificationId = "".obs;

  Future<void> checkPhoneNumber(String number) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // ignore: avoid_print
        print("------------------- verfication completed");
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {}
        // ignore: avoid_print
        print("Error 00000000000000000 ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        // ignore: avoid_print
        print("------------------- co/desent");
        Get.offAll(const AdminOTPScreen());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // ignore: avoid_print
        print("------------------- codeAutoRetrievalTimeout");

        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    print("xxxxxxxxxxxxxxxxxx $otp");
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credential.user != null ? true : false;
  }
}
