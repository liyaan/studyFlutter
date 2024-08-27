import 'package:carousel_slider/carousel_controller.dart';

import 'package:get/get.dart';
import 'package:study_flutter/bean/BaseRes.dart';
import 'package:study_flutter/bean/friend_json_entity.dart';
import 'package:study_flutter/bean/top_json_entity.dart';
import 'package:study_flutter/http/HttpHelper.dart';
import 'package:study_flutter/utils/Const.dart';

import '../bean/banner_entity.dart';

class HomeViewController extends  GetxController{
  CarouselController carouselController = CarouselController();
  var current = 0.obs;
  var mBannerList =  <BannerEntity>[].obs;
  var mTopJsonList =  <TopJsonEntity>[].obs;
  var mFriendJsonList =  <FriendJsonEntity>[].obs;
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    onRefresh();
    print("加载完成");
    super.onReady();
  }

  @override
  void onClose() {
    print("控制器被释放");
    if(mBannerList.isNotEmpty){
      mBannerList.clear();
    }
    if(mTopJsonList.isNotEmpty){
      mTopJsonList.clear();
    }
    if(mFriendJsonList.isNotEmpty){
      mFriendJsonList.clear();
    }
    super.onClose();
  }
  currentValue(value){
    current.value = value;
  }
  onRefresh(){
    getBanner();
    getTopJson();
    getFriendJson();
  }
  getBanner() async {
    BaseRes<List<BannerEntity>>? res = await HttpHelper.instance?.getHttp(Const.BANNER,null,loading: false);
    if(res!=null && res.errorCode == 0){
      if(mBannerList.isNotEmpty) mBannerList.clear();
      mBannerList.addAll(res.data);
    }
  }
  getTopJson() async {
    BaseRes<List<TopJsonEntity>>? res = await HttpHelper.instance?.getHttp(Const.TOP_JSON,null,loading: false);
    if(res!=null && res.errorCode == 0){
      if(mTopJsonList.isNotEmpty) mTopJsonList.clear();
      mTopJsonList.addAll(res.data);
    }
  }
  getFriendJson() async {
    BaseRes<List<FriendJsonEntity>>? res = await HttpHelper.instance?.getHttp(Const.FRIEND_JSON,null,loading: false);
    if(res!=null && res.errorCode == 0){
      if(mFriendJsonList.isNotEmpty) mFriendJsonList.clear();
      mFriendJsonList.addAll(res.data);
    }
  }
}