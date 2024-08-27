import 'package:get/get.dart';
import 'package:study_flutter/bean/BaseRes.dart';

import '../bean/navi_json_entity.dart';
import '../http/HttpHelper.dart';
import '../utils/Const.dart';

class NaviController extends  GetxController{
  var list = <NaviJsonEntity>[].obs;
  @override
  void onInit() {
    settingListData();
    super.onInit();
  }
  @override
  void onClose() {
    print("控制器被释放");
    if(list.isNotEmpty){
      list.clear();
    }
    super.onClose();
  }
  settingListData() async {
    BaseRes<List<NaviJsonEntity>>? res = await HttpHelper.instance?.getHttp(Const.NAVI_JSON,null,loading: false);
    if(res!=null && res.errorCode == 0){
      if(list.isNotEmpty){
        list.clear();
      }
      list.addAll(res.data);
    }
  }
}