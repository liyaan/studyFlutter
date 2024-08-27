import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/controller/ProjectTreeController.dart';
import 'package:study_flutter/view/AppBarView.dart';

import '../routes/AppRoutes.dart';



class ProjectTreePageState extends GetView<ProjectTreeController> {
  const ProjectTreePageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: "项目分类",
        colorType:false,
        leading: IconButton(
            icon:const Icon(Icons.arrow_back_ios),
            onPressed:() {
              Get.back();
            }
        ),
      ),
      body: Obx((){
        return ListView.separated(itemBuilder: (context,index){
          return InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(
                controller.mProjectTreeJsonEntity.value[index].name,
                style: const TextStyle(color: Colors.black87,fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: (){
              Get.toNamed("$PROJECT_TREE_LIST_VIEW?id=${controller.mProjectTreeJsonEntity.value[index].id}&name=${controller.mProjectTreeJsonEntity.value[index].name}");
            },
          );
        }, separatorBuilder: (context,index){
          return const Divider(
            height:2,
            color: Colors.white12,
          );
        }, itemCount: controller.mProjectTreeJsonEntity.value.length);
      }),
    );
  }
}
