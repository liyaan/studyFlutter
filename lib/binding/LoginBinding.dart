import 'package:get/get.dart';
import 'package:study_flutter/controller/LoginController.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}