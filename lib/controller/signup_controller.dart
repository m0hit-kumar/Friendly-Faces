import "package:friendly_faces/controller/auth_manager.dart";
import "package:get/get.dart";

class ConcreteGetxController extends GetxController {}

class SignUpController extends GetxController {
  // static get instance => Get.find();
  final authManager = Get.put(AutenticationManager());
  void test() {
    print("xxxxxxxxxxxxxxxxxxxxxxxx");
  }

  void phoneAuthentication(String phone) {
    print("00000000000000000000000000");
    phone = "+91$phone";
    authManager.checkPhoneNumber(phone);
  }
}
