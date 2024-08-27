import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/controller/MyController.dart';
import 'package:study_flutter/utils/ToastMsg.dart';

import '../routes/AppRoutes.dart';
import '../utils/Const.dart';
import '../utils/get_storage_utils.dart';

class MyViewPageState extends GetView<MyController> {
  const MyViewPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120.0,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                  )
                ]),
            child: Obx((){
              return Row(
                children: [
                  Image.asset(
                    "images/home_header_photo.png",
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.isLogin.value
                                ? GetStorageUtils.readData(Const.LOGIN_NAME)
                                : "用户名称",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "用户等级",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        if (GetStorageUtils.isLogin()) {
                          ToastMsg.show("已经登陆,信息详情正在开发中");
                        } else {
                          Get.toNamed(LOGIN);
                        }
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "退出登录",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    onTap: (){
                      if(controller.isLogin.value){
                        controller.exitLogin();
                      }else{
                        ToastMsg.show("请先去登录");
                      }

                    },
                  ),
                ],
              );
            }),
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 6,
                    )
                  ]),
              alignment: Alignment.center,
              child: const Text(
                "tab项目展示",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(PROJECT_TAB_VIEW);
            },
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 6,
                    )
                  ]),
              alignment: Alignment.center,
              child: const Text(
                "滑动悬停",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(SCROLL_VIEW_TAB_VIEW);
            },
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 6,
                    )
                  ]),
              alignment: Alignment.center,
              child: const Text(
                "滑动悬停Tab",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(TAB_BAR_VIEW_TAB_VIEW);
            },
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 6,
                    )
                  ]),
              alignment: Alignment.center,
              child: const Text(
                "分区列表",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(STICK_SLIVER_LIST_VIEW);
            },
          ),
        ],
      ),
    );
  }
}
