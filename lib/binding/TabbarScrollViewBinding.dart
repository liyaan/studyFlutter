import 'package:get/get.dart';
import '../controller/TabbarScrollViewController.dart';

class TabbarScrollViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TabbarScrollViewController());
  }
}