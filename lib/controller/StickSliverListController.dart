import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class StickSliverListController extends  GetxController{
  Map<String, List<String>> moreItemSectionList = {
    '拜访一区': ["远程拜访", "远程订单", "店前拜访提醒"],
    '拜访二区': ["远程拜访", "远程订单", "店前拜访提醒", "1-进入门店", "2-生动化执行"],
    '拜访三区': ["远程拜访", "远程订单", "店前拜访提醒", "1-进入门店", "2-生动化执行", "3-店铺检查"],
    '拜访四区': ["远程拜访"],
    '拜访五区': ["远程拜访", "远程订单", "店前拜访提醒", "1-进入门店", "2-生动化执行", "3-店铺检查"],
    '拜访六区': ["1-进入门店", "2-生动化执行", "3-店铺检查"],
    '拜访⑦区': ["远程拜访", "远程订单", "店前拜访提醒", "1-进入门店", "2-生动化执行", "3-店铺检查"],
    '拜访⑧区': ["3-店铺检查"],
    '拜访⑨区': ["远程拜访", "远程订单", "1-进入门店", "2-生动化执行", "3-店铺检查"],
  };
  List<ExpendedModel?> dataList = [];

  ScrollController scrollController = ScrollController();

  final GlobalKey scrollKey = GlobalKey();

  var titleIndex = 0.obs;
  var showTitleTopButton = false.obs;
  @override
  void onInit() {
    super.onInit();
    dataList = List.generate(moreItemSectionList.length, (index) {
      final List titles = moreItemSectionList.keys.toList();
      String titlekey = titles[index];
      List cellList = moreItemSectionList[titlekey] as List;
      return ExpendedModel(false, cellList, titlekey);
    });

    scrollController.addListener(scrollChanged);
  }
  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(scrollChanged);
  }
  scrollChanged() {
    if (dataList.isEmpty) {
      return;
    }
    var item = dataList.lastWhere((item) {
      if (item!.globalKey.currentContext == null) {
        return false;
      }

      ///获取 renderBox
      RenderSliver? renderSliver =
      item.globalKey.currentContext!.findRenderObject() as RenderSliver?;
      if (renderSliver == null) {
        return false;
      }
      return renderSliver.constraints.scrollOffset > 0;
    }, orElse: () {
      return null;
    });
    if (item == null) {
      return;
    }

    int currentIndex = dataList.indexOf(item);
    if (currentIndex != titleIndex.value) {
      titleIndex.value = currentIndex;
    }
    var needTopButton = scrollController.position.pixels > 0;
    if (needTopButton != showTitleTopButton.value) {
      showTitleTopButton.value = needTopButton;
    }
  }
}
class ExpendedModel {
  bool expended;

  List dataList;

  GlobalKey globalKey = GlobalKey();

  String sectionTitle;

  ExpendedModel(this.expended, this.dataList, this.sectionTitle);
}