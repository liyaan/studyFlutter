import 'package:get/get.dart';
import 'package:study_flutter/bean/project_tree_json_entity.dart';
import 'package:study_flutter/controller/ProjectTreeController.dart';


class ProjectTreeBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(ProjectTreeController());
  }
}