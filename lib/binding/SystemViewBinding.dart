import 'package:get/get.dart';
import '../controller/SystemViewController.dart';

class SystemViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SystemViewController());
  }
}