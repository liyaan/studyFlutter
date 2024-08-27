import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/controller/ProjectListController.dart';

import '../bean/article_list_entity.dart';
import '../bean/project_list_json_entity.dart';
import '../routes/AppRoutes.dart';
import '../view/AppBarView.dart';

class ProjectListViewPageState extends GetView<ProjectListController> {
  const ProjectListViewPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    return _listTv(controller.list.value[index], context);
                  },
                  itemCount: controller.list.length,
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
  Widget _listTv(ProjectListJsonDatas item, BuildContext context) {
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
        Get.toNamed(PROJECT_INFO_VIEW,arguments: item.toMap());
      },
    );
  }
}
