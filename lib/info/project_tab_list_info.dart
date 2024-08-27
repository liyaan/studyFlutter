import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bean/project_list_json_entity.dart';
import '../controller/ProjectTabListController.dart';
import '../routes/AppRoutes.dart';
import '../view/AppBarView.dart';

class ProjectTabListViewPageState extends GetView<ProjectTabListController> {
  final int cid;
  ProjectTabListViewPageState(this.cid,{Key? key}) : super(key: key){
    controller.id.value = cid;
    controller.update();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
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
