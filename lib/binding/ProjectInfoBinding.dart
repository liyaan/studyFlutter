import 'package:get/get.dart';
import '../controller/ProjectInfoController.dart';

class ProjectInfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProjectInfoController());
  }
}