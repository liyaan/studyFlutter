import 'package:get/get.dart';

import '../controller/NaviController.dart';

class NaviBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NaviController());
  }
}