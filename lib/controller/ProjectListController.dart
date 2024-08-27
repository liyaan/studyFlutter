import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_flutter/bean/BaseRes.dart';
import 'package:study_flutter/http/HttpHelper.dart';

import '../bean/project_list_json_entity.dart';
import '../utils/Const.dart';
import '../utils/ToastMsg.dart';
class ProjectListController extends  GetxController{
  final entity = ProjectListJsonEntity().obs;
  final list = <ProjectListJsonDatas>[].obs;

  final page = 0.obs;
  final id = "".obs;
  final name = "".obs;
  ScrollController scrollController = ScrollController(); //listview的控制器
  @override
  void onInit() {
    id.value = Get.parameters['id']!;
    name.value = Get.parameters['name']!;
    projectTreeData();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent-20) {
        print('滑动到了最底部');
        onUpdate();
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    page.value = 0;
    if(list.isNotEmpty) list.clear();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.onClose();
  }

  onRefresh(){
    page.value=0;
    projectTreeData();
  }
  onUpdate(){
    page.value++;
    projectTreeData();
  }

  projectTreeData() async {
    if(entity.value!=null && list.value.isNotEmpty){
      print("${entity.value.pageCount} ${page.value}");
      if(page.value>=entity.value.pageCount){
        ToastMsg.show("没有更多数据");
        page.value --;
        return;
      }
    }
    BaseRes<ProjectListJsonEntity>? res = await HttpHelper.instance?.getHttp(
        "${Const.PROJECT_TREE_LIST_JSON}${page.value}/json?cid=${id.value}",null,loading: false);
    if(res!=null && res.errorCode == 0){
      if(page.value==0){
        if(list.value.isNotEmpty) list.clear();
      }
     entity.value = res.data;
     list.addAll(res.data.datas);
    }
  }
}