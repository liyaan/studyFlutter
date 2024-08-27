import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_flutter/bean/BaseRes.dart';
import 'package:study_flutter/http/HttpHelper.dart';

import '../bean/project_tree_json_entity.dart';
import '../utils/Const.dart';
class ProjectTreeController extends  GetxController{
  final mProjectTreeJsonEntity = <ProjectTreeJsonEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    projectTreeData();
    super.onReady();
  }
  @override
  void onClose() {
    if(mProjectTreeJsonEntity.isNotEmpty)mProjectTreeJsonEntity.clear();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.onClose();
  }
  projectTreeData() async {
    BaseRes<List<ProjectTreeJsonEntity>>? res = await HttpHelper.instance?.getHttp(
        Const.PROJECT_TREE_JSON,null,loading: false);
    if(res!=null && res.errorCode == 0){
      if(mProjectTreeJsonEntity.isNotEmpty)mProjectTreeJsonEntity.clear();
      print(res.data.length);
      mProjectTreeJsonEntity.addAll(res.data);
    }
  }
}