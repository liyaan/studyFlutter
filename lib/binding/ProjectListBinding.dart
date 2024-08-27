import 'package:get/get.dart';
import '../controller/ProjectListController.dart';

class ProjectListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProjectListController());
  }
}