import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:study_flutter/controller/NaviController.dart';
import 'package:study_flutter/view/stick_widget.dart';

import '../bean/Test.dart';
import '../bean/navi_json_entity.dart';
import '../routes/AppRoutes.dart';

class NaviPageState extends GetView<NaviController> {
  const NaviPageState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {
            String title = controller.list.value[index].name;
            List<NaviJsonArticles> list = controller.list.value[index].articles;
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white70,
              child: StickWidget(
                stickHeader: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                stickContent:  Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white70,
                  child: Expanded(
                    child: Column(
                      children: List.generate(list.length, (index){
                        return GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              list[index].title,
                              style: const TextStyle(color: Colors.black, fontSize: 18),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          onTap: (){
                            Get.toNamed(WEBVIEW_VIEW, arguments: {"url":list[index].link,"name":list[index].title});
                          },
                        );
                      }),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: controller.list.length,
        );
      }),
    );
  }

  Widget _sliversWidget(Test e) {
    return Text(e.name);
  }
}
