import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:study_flutter/home/system_view.dart';

import '../home/home_view.dart';
import '../home/my_view.dart';
import '../home/nvi_view.dart';

class HomeController extends  GetxController{
  var currentIndex = 0.obs;
  final pageOptions = [
    const HomeViewPageState(),
    const SystemViewPageState(),
    const Center(child: Text('Message Page')),
    const NaviPageState(),
    const MyViewPageState(),
  ];
  @override
  void onReady() {
    super.onReady();
    print('ExampleController is ready.');
  }
  back(){

  }
  onTab(index){
    currentIndex.value = index;
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    print('ExampleController is ready.');
  }
}