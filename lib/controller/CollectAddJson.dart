
import 'package:study_flutter/utils/ToastMsg.dart';

import '../bean/BaseRes.dart';
import '../bean/collect_add_entity.dart';
import '../http/HttpHelper.dart';
import '../utils/Const.dart';

class CollectAddJson{
  ///lg/collect/add/json
  static Future<void> addCollect(String title,String author,String link) async {
    final data = <String, dynamic>{};
    data["title"] = title;
    data["author"] = author;
    data["link"] = link;
    BaseRes<CollectAddEntity>? entity = await HttpHelper
        .instance?.postHttp(Const.COLLECT_ADD_JSON, data);
    if(entity!=null){
      if(entity.errorCode==0){
        ToastMsg.show("收藏成功");
      }else{
        ToastMsg.show(entity.errorMsg);
      }
    }

  }
}