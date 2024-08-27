import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../bean/article_list_entity.dart';
import '../controller/SystemInfoViewController.dart';
import '../routes/AppRoutes.dart';
import '../view/AppBarView.dart';

class SystemInfoViewPageState extends GetView<SystemInfoViewController> {
  const SystemInfoViewPageState({Key? key}) : super(key: key);

  //Text("data ${Get.parameters['id']} ${Get.parameters['name']}");
  @override
  Widget build(BuildContext context) {
    // controller.articleList(Get.parameters['id'],0);
    return Scaffold(
      appBar: AppBarView(
        title: Get.parameters['name']!,
        colorType: false,
        leading: IconButton(
            icon:const Icon(Icons.arrow_back_ios),
            onPressed:() {
              Get.back();
            }
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0,
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              color: Colors.lightGreen,
              child: Text(
                controller.name.value,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemBuilder: (context, index) {
                    return _listTv(controller.mDatas.value[index], context);
                  },
                  itemCount: controller.mDatas.length,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
  Future<void> _onRefresh() async {
    controller.onRefresh();

  }
  //Get.toNamed(WEBVIEW_VIEW, arguments: {"url":entity.link,"name":entity.name});
  Widget _listTv(ArticleListDatas item, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        child: Text(
          item.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      onTap: (){
        Get.toNamed(WEBVIEW_VIEW, arguments: {"url":item.link,"name":item.title});
      },
    );
  }
}
