import 'package:get/get.dart';
import 'package:study_flutter/controller/HomeController.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}