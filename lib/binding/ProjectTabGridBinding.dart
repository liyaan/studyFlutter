import 'package:get/get.dart';
import '../controller/ProjectTabGridController.dart';


class ProjectTabGridBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(ProjectTabGridController());
  }
}