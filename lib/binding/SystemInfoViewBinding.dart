import 'package:get/get.dart';

import '../controller/SystemInfoViewController.dart';


class SystemInfoViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SystemInfoViewController());
  }
}