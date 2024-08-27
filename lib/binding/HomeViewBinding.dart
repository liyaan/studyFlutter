import 'package:get/get.dart';
import '../controller/HomeViewController.dart';

class HomeViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeViewController());
  }
}