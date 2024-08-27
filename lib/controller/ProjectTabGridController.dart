import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_flutter/bean/BaseRes.dart';
import 'package:study_flutter/http/HttpHelper.dart';

import '../bean/project_tree_json_entity.dart';
import '../utils/Const.dart';

class ProjectTabGridController extends GetxController
    with GetTickerProviderStateMixin {
  final mProjectTreeJsonEntity = <ProjectTreeJsonEntity>[].obs;
  var listTab = <Text>[].obs;
  TabController? tabController;
  final length = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController ??= TabController(length: 0, vsync: this);
    tabController?.addListener(() {
      if (tabController?.animation?.value == tabController?.index) {
        print("当前选中的索引值为: ${tabController?.index}"); //获取点击或滑动页面的索引值
        update();
      }
    });
    projectTreeData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    if (mProjectTreeJsonEntity.isNotEmpty) mProjectTreeJsonEntity.clear();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    tabController?.dispose();
    super.onClose();
  }

  projectTreeData() async {
    BaseRes<List<ProjectTreeJsonEntity>>? res = await HttpHelper.instance
        ?.getHttp(Const.PROJECT_TREE_JSON, null, loading: false);
    if (res != null && res.errorCode == 0) {
      if (mProjectTreeJsonEntity.isNotEmpty) mProjectTreeJsonEntity.clear();
      mProjectTreeJsonEntity.addAll(res.data);
      if (mProjectTreeJsonEntity.value.length > tabController!.length) {
        tabController = TabController(
          length: mProjectTreeJsonEntity.length,
          vsync: this,
        );
        // listTab.value = mProjectTreeJsonEntity.value.map((element){
        //   return Text(element.name);
        // }).toList();
      }
        // listTab.value = mProjectTreeJsonEntity.value.map((element){
        //   return Text(element.name);
        // }).toList();

      //   tabController.addListener(() {
      //     if (tabController.animation?.value == tabController.index) {
      //       print("当前选中的索引值为: ${tabController.index}"); //获取点击或滑动页面的索引值
      //     }
      //   });
    }
  }
}
