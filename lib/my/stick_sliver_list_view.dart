import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../controller/StickSliverListController.dart';
import '../view/AppBarView.dart';
import 'SliverExpandedList.dart';

class StickSliverListPageState extends GetView<StickSliverListController> {
  const StickSliverListPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBarView(
          title: "分区列表",
          colorType: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
          body: Stack(
            children: <Widget>[
              Container(
                child: CustomScrollView(
                  key: controller.scrollKey,
                  controller: controller.scrollController,
                  physics: const ClampingScrollPhysics(),
                  slivers: List.generate(controller.dataList.length, (index) {
                    // Log.i('数据----->$index');
                    //分区的数据
                    ExpendedModel sectionModel =
                    controller.dataList[index] as ExpendedModel;

                    return SliverExpandedList(
                      sectionModel,
                      "header $index",
                      visibleCount: sectionModel.dataList.length,

                    );
                  }),
                ),
              ),
              StickHeader(
                "header ${controller.titleIndex.value}",
                showTopButton: controller.showTitleTopButton.value,
                callback: () {
                  var item = controller.dataList[controller.titleIndex.value]!;
                  RenderSliver renderSliver = item.globalKey.currentContext!
                      .findRenderObject() as RenderSliver;
                  var position = controller.scrollController.position.pixels -
                      renderSliver.constraints.scrollOffset;
                  controller.scrollController.position.jumpTo(position);
                },
                sectionModel: controller.dataList[controller.titleIndex.value] as ExpendedModel,
              )
            ],
          ));

    });
  }
}
