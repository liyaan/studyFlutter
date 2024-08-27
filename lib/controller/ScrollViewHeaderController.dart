import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollViewHeaderController extends  GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;
  final list = <String>[
    "a","b","c","d"
  ];
  @override
  void onInit() {
    tabController ??= TabController(length: 4, vsync: this);
    tabController?.addListener(() {
      if (tabController?.animation?.value == tabController?.index) {
        print("当前选中的索引值为: ${tabController?.index}"); //获取点击或滑动页面的索引值
        update();
      }
    });
    super.onInit();
  }
}