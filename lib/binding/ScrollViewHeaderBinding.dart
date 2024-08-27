import 'package:get/get.dart';
import '../controller/ScrollViewHeaderController.dart';

class ScrollViewHeaderBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ScrollViewHeaderController());
  }
}