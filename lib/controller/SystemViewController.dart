
import 'package:get/get.dart';
import 'package:study_flutter/bean/BaseRes.dart';
import 'package:study_flutter/bean/tree_json_entity.dart';

import '../http/HttpHelper.dart';
import '../utils/Const.dart';

class SystemViewController extends  GetxController{

  var mTreeJsonList =  <TreeJsonEntity>[].obs;
  var selectIndex = 0.obs;


  @override
  void onReady() {
    getTreeJson();
    super.onReady();
  }
  @override
  void onClose() {
    print("控制器被释放");
    if(mTreeJsonList.isNotEmpty){
      mTreeJsonList.clear();
    }
    super.onClose();
  }
  getTreeJson() async {
    BaseRes<List<TreeJsonEntity>>? res = await HttpHelper.instance?.getHttp(Const.TREE_JSON,null,loading: false);
    if(res!=null && res.errorCode == 0){
      if(mTreeJsonList.isNotEmpty){
        mTreeJsonList.clear();
      }
      mTreeJsonList.addAll(res.data);
    }
  }
}