import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/TabbarScrollViewController.dart';
import '../view/AppBarView.dart';

class TabBarScrollViewHeaderPageState
    extends GetView<TabbarScrollViewController> {
  const TabBarScrollViewHeaderPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: "详情",
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            }),
      ),
      body:Obx((){
        return  Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return Container(
                              key: controller.keyList[index],
                              height: 600,
                              color: controller.colorList[index],
                            );
                          },
                          childCount: controller.keyList.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if(controller.isShowTabBar.value)
              Positioned(
                top: 0,
                width: MediaQuery.of(context).size.width,
                child: Opacity(
                  opacity: controller.opacity.value,
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: controller.tabController,
                      indicatorColor: const Color(0xfffdd108),
                      labelColor: const Color(0xff343a40),
                      unselectedLabelColor: const Color(0xff8e9aa6),
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                      isScrollable: true,
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      tabs: _buildTabsWidget(),
                      onTap: (index) {
                        controller.onTabChanged(index);
                      },
                    ),
                  ),
                ),
              )
          ],
        );
      }),
    );
  }

  List<Widget> _buildTabsWidget() {
    String keyValue = DateTime.now().millisecondsSinceEpoch.toString();
    return controller.list.map((e) {
      return Tab(
        key: Key(keyValue),
        child: Text(e),
      );
    }).toList();
  }
}
