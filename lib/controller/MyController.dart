import 'package:get/get.dart';

import '../bean/BaseRes.dart';
import '../http/HttpHelper.dart';
import '../utils/Const.dart';
import '../utils/get_storage_utils.dart';

class MyController extends  GetxController{
  var isLogin = true.obs;


  @override
  void onInit() {
    super.onInit();
    print("MyController onInit  aaaaaaaaaaaaaaaaa");
    isLogin.value = GetStorageUtils.isLogin();
  }

  @override
  void refresh() {
    print("MyController refresh  aaaaaaaaaaaaaaaaa");
  }

  @override
  void onReady() {
    print("MyController onReady  aaaaaaaaaaaaaaaaa");
  }


  exitLogin() async {
    BaseRes<String>? res = await HttpHelper.instance?.getHttp(Const.EXIT_LOGIN_JSON,null,loading: false);
    if(res!=null && res.errorCode == 0){
      isLogin.value = GetStorageUtils.clearLoginData();
    }
  }
}