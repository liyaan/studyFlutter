import 'package:get/get.dart';
import '../controller/StickSliverListController.dart';
import '../controller/TabbarScrollViewController.dart';



class StickSliverListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(StickSliverListController());
  }
}