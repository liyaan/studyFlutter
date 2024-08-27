import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';
import '../controller/WebViewOneController.dart';
import '../view/AppBarView.dart';

class WebViewViewPageState extends GetView<WebViewOneController> {
  const WebViewViewPageState({Key? key}) : super(key: key);

  //Text("data ${Get.parameters['id']} ${Get.parameters['name']}");
  @override
  Widget build(BuildContext context) {
    dynamic args = Get.arguments;
    return Scaffold(
      appBar: AppBarView(
        title: args['name']!,
        colorType: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
