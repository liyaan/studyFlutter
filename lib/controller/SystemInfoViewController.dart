
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_flutter/bean/BaseRes.dart';
import 'package:study_flutter/http/HttpHelper.dart';
import 'package:study_flutter/utils/ToastMsg.dart';

import '../bean/article_list_entity.dart';
import '../utils/Const.dart';

class SystemInfoViewController extends  GetxController{
  final  mArticleList =  ArticleListEntity().obs;
  final  mDatas = <ArticleListDatas>[].obs;
  final page = 0.obs;
  final id = "".obs;
  final name = "".obs;
  ScrollController scrollController = ScrollController(); //listview的控制器
  @override
  void onInit() {
    id.value = Get.parameters['id']!;
    name.value = Get.parameters['name']!;
    articleList();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent-20) {
        print('滑动到了最底部');
        onUpdate();
      }
    });
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    print("控制器被释放");
    page.value = 0;
    if(mDatas.value.isNotEmpty) mDatas.clear();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.onClose();
  }
  onRefresh(){
    page.value=0;
    articleList();
  }
  onUpdate(){
    page.value++;
    articleList();
  }
  articleList() async {
    if(mArticleList.value!=null && mDatas.value.isNotEmpty){
      print("${mArticleList.value.pageCount} ${page.value}");
      if(page.value>=mArticleList.value.pageCount){
        ToastMsg.show("没有更多数据");
        page.value --;
        return;
      }
    }
    BaseRes<ArticleListEntity>? res = await HttpHelper.instance?.getHttp(
        "${Const.ARTICLE_LIST}${page.value}/json?cid=${id.value}",null,loading: false);
    if(res!=null && res.errorCode == 0){
      if(page.value==0){
        if(mDatas.value.isNotEmpty) mDatas.clear();
      }
      mArticleList.value = res.data;
      mDatas.addAll(mArticleList.value.datas);
    }
  }
}