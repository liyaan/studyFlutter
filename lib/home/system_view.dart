import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/controller/SystemViewController.dart';

import '../bean/tree_json_entity.dart';
import '../routes/AppRoutes.dart';

class SystemViewPageState extends GetView<SystemViewController> {
  const SystemViewPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        margin: const EdgeInsets.only(top: 5.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              color: Colors.white70,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return _tvWidget(controller.mTreeJsonList.value[index],index);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 5,
                      indent: 0,
                      color: Color(0xFFDDDDDD),
                    );
                  },
                  itemCount: controller.mTreeJsonList.value.length),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: Colors.black26,
                    margin: const EdgeInsets.only(top: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: 30.0,
                    child: Text(
                      controller.mTreeJsonList
                          .value[controller.selectIndex.value].name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return _tvChildWidget(controller
                            .mTreeJsonList
                            .value[controller.selectIndex.value]
                            .children[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 5,
                          indent: 0,
                          color: Color(0xFFDDDDDD),
                        );
                      },
                      itemCount: controller.mTreeJsonList
                          .value[controller.selectIndex.value].children.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _tvWidget(TreeJsonEntity entity,int index) {
    return GestureDetector(
      child: Container(
        width: 120.0,
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Text(
          entity.name,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color:controller.selectIndex.value == index?Colors.orange:Colors.black,
          ),
        ),
      ),
      onTap: (){
        controller.selectIndex.value = index;
      },
    );
  }

  Widget _tvChildWidget(TreeJsonChildren entity) {
    return GestureDetector(
      child: Container(
        width: 120.0,
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Text(
          entity.name,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
      onTap: (){
        // Get.to(const SystemInfoViewPageState(), arguments: entity.id); dynamic args = Get.arguments;
        //Get.toNamed("/route?device=phone&id=354&name=Enzo");  Get.parameters['device']
        //Get.back(result: 'success'); var data = await Get.to(CounterPage());
        Get.toNamed("$SYSTEM_IFNO_VIEW?id=${entity.id}&name=${entity.name}");
      },
    );
  }
}
