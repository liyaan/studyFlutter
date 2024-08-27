import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/controller/HomeController.dart';
import 'package:study_flutter/routes/AppRoutes.dart';


class HomePageState extends GetView<HomeController> {
  const HomePageState({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Obx(()=>controller.pageOptions[controller.currentIndex.value]),
      bottomNavigationBar: Obx((){
        return BottomNavigationBar(
          elevation:0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label:"首页"),
            BottomNavigationBarItem(icon: Icon(Icons.class_rounded),label:"体系"),
            BottomNavigationBarItem(icon: SizedBox(), label: '项目'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:"导航"),
            BottomNavigationBarItem(icon: Icon(Icons.account_box),label:"我的")
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent,
          currentIndex: controller.currentIndex.value,
          onTap: (index){
            controller.onTab(index);
          },
        );
      }),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.transparent,
        ),

        margin: const EdgeInsets.only(top:35),
        padding: const EdgeInsets.all(8),
        child:  FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.yellow,
          onPressed: (){
            Get.toNamed(PROJECT_TREE_VIEW);
          },
          child: const Icon(Icons.add),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}
