import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/controller/MyController.dart';
import 'package:study_flutter/controller/ScrollViewHeaderController.dart';
import 'package:study_flutter/view/AppBarView.dart';
import 'package:study_flutter/view/CommonSliverHeaderDelegate.dart';

import '../routes/AppRoutes.dart';

class ScrollViewHeaderPageState extends GetView<ScrollViewHeaderController> {
  const ScrollViewHeaderPageState({Key? key}) : super(key: key);

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
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              delegate: CommonSliverHeaderDelegate(
                  islucency: true,
                  child: PreferredSize(
                    preferredSize: const Size.fromHeight(265.0),
                    child: Column(
                      children: [
                        Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://img-baofun.zhhainiao.com/fs/e49dc3b88138658fcb5a0abb769cc9ab.jpg"))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: const [
                              Text(
                                "标题",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                "价格 ￥100.00",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: CommonSliverHeaderDelegate(
                  islucency: false,
                  child: PreferredSize(
                    preferredSize: const Size(double.infinity, 48),
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                        controller: controller.tabController,
                        tabs: const <Widget>[
                          Tab(
                            child: Text(
                              "宝贝",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "评价",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "详情",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "推荐",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  )),
            ),

          ];
        }),
        body: TabBarView(
          controller: controller.tabController, //tabbar控制器
          children: controller.list.map((element) {
            return Text(element);
          }).toList(),
        ),
      ),
    );
  }
}
