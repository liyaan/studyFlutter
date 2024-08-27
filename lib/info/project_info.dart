import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/ProjectInfoController.dart';
import '../routes/AppRoutes.dart';
import '../view/AppBarView.dart';

class ProjectInfoViewPageState extends GetView<ProjectInfoController> {
  const ProjectInfoViewPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBarView(
          title: controller.data.value["title"],
          colorType: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Stack(
          children: [
            Expanded(
                child:Column(
                  children: [
                    Obx(() {
                      return Visibility(
                        visible:controller.visible.value,
                        child: LinearProgressIndicator(
                          value: controller.progrss.value,
                        ),
                      );
                    }),
                    Expanded(
                      child: WebViewWidget(
                        controller: controller.webViewController,
                      ),
                    ),
                  ],
                )
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.amber),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(WEBVIEW_VIEW, arguments: {
                        "url": controller.data.value["projectLink"],
                        "name": controller.data.value["title"]
                      });
                    },
                    child: const Text(
                      "打开git",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                )),
          ],
        ),
      );
    });
  }
}
