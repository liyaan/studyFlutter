import 'package:get/get.dart';

import '../controller/MyController.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MyController());
  }
}