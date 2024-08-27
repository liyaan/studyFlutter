import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:study_flutter/bean/BaseRes.dart';
import 'package:study_flutter/bean/hot_entity.dart';
import 'package:study_flutter/bean/login_json_entity.dart';
import 'package:study_flutter/http/HttpHelper.dart';
import 'package:study_flutter/utils/ToastMsg.dart';

import '../routes/AppRoutes.dart';
import '../utils/Const.dart';
import '../utils/get_storage_utils.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginKey =GlobalKey();
  String username = "";
  String password = "";
  String repassword = "";
  login() async {
    var loginForm  = loginKey.currentState;
    if( loginForm!=null &&loginForm.validate()) {
      loginForm.save();
      final data = <String, dynamic>{};
      data["username"] = username;
      data["password"] = password;
      BaseRes<LoginJsonEntity>? entity = await HttpHelper
          .instance?.postHttp(Const.USER_LOGIN_JSON, data);

      // GetStorageUtils.writeData(Const.LOGIN_NAME, username);
      // print(GetStorageUtils.readData(Const.LOGIN_NAME));
      // Get.offAndToNamed('/home');
      if(entity!=null){
        if(entity.errorCode==0){
          GetStorageUtils.writeData(Const.LOGIN_NAME, username);
          GetStorageUtils.writeData(Const.LOGIN_PASSWORD, password);
          print(GetStorageUtils.readData(Const.LOGIN_NAME));
          Get.offAllNamed(HOME);
        }else{
          ToastMsg.show(entity.errorMsg);
        }
      }else{
        ToastMsg.show("错误登录");
      }

      // BaseRes<List<HotEntity>>? hotEntity = await HttpHelper.instance?.getHttp("/hotkey/json",loading: false);
      // if(hotEntity!=null && hotEntity.data.isNotEmpty){
      //   print("${hotEntity.errorCode}  ${hotEntity.errorMsg}");
      //   for (var element in hotEntity.data) {
      //     print(element.name);
      //   }
      // }else{
      //   print('user name = $username --- password = $password');
      // }
    }
  }

  regiter() async {
    var loginForm  = loginKey.currentState;
    if( loginForm!=null &&loginForm.validate()) {
      loginForm.save();
      final data = <String, dynamic>{};
      data["username"] = username;
      data["password"] = password;
      data["repassword"] = repassword;
      BaseRes<LoginJsonEntity>? entity = await HttpHelper
          .instance?.postHttp(Const.USER_REGISTER_JSON, data);
      if(entity!=null){
        if(entity.errorCode==0){
          // GetStorageUtils.writeData(Const.LOGIN_NAME, username);
          // print(GetStorageUtils.readData(Const.LOGIN_NAME));
          Get.offAndToNamed(LOGIN);
          ToastMsg.show("注册成功");
        }else{
          ToastMsg.show(entity.errorMsg);
        }
      }else{
        ToastMsg.show("错误登录");
      }
    }
  }
  back(){
    Get.back();
  }
}