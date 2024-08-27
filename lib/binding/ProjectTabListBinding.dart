import 'package:get/get.dart';
import 'package:study_flutter/controller/ProjectTabGridController.dart';
import 'package:study_flutter/controller/ProjectTabListController.dart';
import '../controller/ProjectListController.dart';

class ProjectTabListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProjectTabListController());
  }
}