import "package:friendly_faces/controller/auth_manager.dart";
import 'package:friendly_faces/pages/dashboard/homepage.dart';
import "package:get/get.dart";

class OtpController extends GetxController {
  static get instance => Get.find();
  final authManager = Get.put(AutenticationManager());

  Future<void> verifyOtp(String otp) async {
    var isVerfied = authManager.verifyOTP(otp);

    await isVerfied ? Get.offAll(const HomePage()) : Get.back();
  }
}
