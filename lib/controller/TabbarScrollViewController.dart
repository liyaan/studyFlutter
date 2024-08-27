import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class TabbarScrollViewController extends  GetxController with SingleGetTickerProviderMixin,WidgetsBindingObserver{
  TabController? tabController;
  final list = <String>[
    "商品","详情","评价","推荐"
  ];
  var keyList = <GlobalKey>[];
  var colorList = <Color>[
    const Color(0xffff0000),
    const Color(0xfff7f000),
    const Color(0xff00ff00),
    const Color(0xff8B00ff)
  ];
  ScrollController scrollController = ScrollController();

  var heightList = <double>[];
  var targetKey = GlobalKey().obs;
  var isShowTabBar = true.obs;
  final double TAB_HEIGHT = 48;
  var opacity = 0.0.obs;
  @override
  void onInit() {
    for (var element in list) {
      keyList.add(GlobalKey());
    }
    heightList = List.filled(list.length, 0);
    targetKey.value = keyList[0];

    scrollController.addListener(() {
      initHeightList();
      double showTabBarOffset;
      try{
        showTabBarOffset = keyList[0].currentContext!.size!.height - TAB_HEIGHT;
      }catch(e){
        showTabBarOffset = heightList[0] - TAB_HEIGHT;
      }
      if(scrollController.offset>=showTabBarOffset){
        opacity.value = 1;
      }else{
        opacity.value = scrollController.offset/showTabBarOffset;
        if(opacity<0) opacity.value = 0;
      }
      if(scrollController.position.userScrollDirection == ScrollDirection.reverse ||
        scrollController.position.userScrollDirection == ScrollDirection.forward){
        double totalOffset = - TAB_HEIGHT;
        for(int i = 0;i<keyList.length;i++){
          if(scrollController.offset>=totalOffset && scrollController.offset<totalOffset+heightList[i]){
            tabController?.animateTo(i,duration: const Duration(milliseconds: 0));
            return;
          }
          totalOffset+=heightList[i];
        }
      }
    });
    WidgetsBinding.instance.addObserver(this);
    tabController ??= TabController(length: list.length, vsync: this);
    tabController?.addListener(() {
      if (tabController?.animation?.value == tabController?.index) {
        print("当前选中的索引值为: ${tabController?.index}"); //获取点击或滑动页面的索引值
        update();
      }
    });
    super.onInit();
  }

  initHeightList() {
    for (int i=0;i<keyList.length;i++) {
      if(keyList[i].currentContext!=null){
        try{
          heightList[i] = keyList[i].currentContext!.size!.height;
        }catch(e){
          print("can not get size, so do not");
        }
      }
    }
  }
  gotoAnchorPoint() async{
    GlobalKey key = targetKey.value;
    if(key.currentContext!=null){
      scrollController.position.ensureVisible(
          key.currentContext!.findRenderObject()!,
          alignment: 0.0).then((value){
            if(scrollController.offset-TAB_HEIGHT>0){
              scrollController.jumpTo(scrollController.offset-TAB_HEIGHT);
            }
      });
      return;
    }
    int nearestRenderedIndex = 0;
    bool foundIndex = false;
    for(int i=keyList.indexOf(key)-1;i>=0;i-=1){
      if(keyList[i].currentContext!=null){
        try{
          Size? size = keyList[i].currentContext?.size;
          foundIndex = true;
          nearestRenderedIndex = i;
        }catch(e){
          print("Size not ava");
        }
        break;
      }
    }
    if(!foundIndex){
      for(int i=keyList.indexOf(key)+1;i<keyList.length;i+=1){
        if(keyList[i].currentContext!=null){
          try{
            Size? size = keyList[i].currentContext?.size;
            foundIndex = true;
            nearestRenderedIndex = i;
          }catch(e){
            print("Size not ava");
          }
          break;
        }
      }
    }
    int increasedOffset = nearestRenderedIndex<keyList.indexOf(key)?1:-1;
    for(int i=nearestRenderedIndex;i>=0 && i<keyList.length;i+=increasedOffset){
      if(keyList[i].currentContext==null){
        Future.delayed(const Duration(microseconds: 10),(){
          gotoAnchorPoint();
        });
        return;
      }
      if(keyList[i]!=targetKey){
        await scrollController.position.ensureVisible(
          keyList[i].currentContext!.findRenderObject()!,
          alignment: 0.0,
          curve: Curves.linear,
          alignmentPolicy: increasedOffset == 1
              ? ScrollPositionAlignmentPolicy.keepVisibleAtEnd
              :ScrollPositionAlignmentPolicy.keepVisibleAtStart
        );
      }else{
        await scrollController.position.ensureVisible(
          keyList[i].currentContext!.findRenderObject()!,
          alignment: 0.0,
        ).then((value){
          Future.delayed(Duration(microseconds: 1000),(){
            if(scrollController.offset - TAB_HEIGHT >0){
              scrollController.jumpTo(scrollController.offset-TAB_HEIGHT);
            }else{}
          });
        });
        break;
      }
    }
  }
  onTabChanged(int index){
    targetKey.value = keyList[index];
    gotoAnchorPoint();
  }

}