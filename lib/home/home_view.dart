import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/bean/friend_json_entity.dart';
import 'package:study_flutter/bean/top_json_entity.dart';
import 'package:study_flutter/controller/CollectAddJson.dart';

import '../controller/HomeViewController.dart';
import '../routes/AppRoutes.dart';

class HomeViewPageState extends GetView<HomeViewController> {
  const HomeViewPageState({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Obx(() {
              return Stack(
                children: [
                  CarouselSlider(
                    items: controller.mBannerList.value.map((i) {
                      return Builder(builder: (BuildContext context) {
                        return _bannerWidget(i.imagePath, context);
                      });
                    }).toList(),
                    carouselController: controller.carouselController,
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          controller.currentValue(index);
                        }),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.mBannerList.value
                          .asMap()
                          .entries
                          .map((entry) {
                        return GestureDetector(
                          onTap: () => controller.carouselController
                              .animateToPage(entry.key),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.grey)
                                    .withOpacity(
                                        controller.current.value == entry.key
                                            ? 0.9
                                            : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }),
            Obx(() {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                shrinkWrap: true,
                itemCount: controller.mBannerList.value.length,
                padding: const EdgeInsets.only(left: 10, right: 10),
                itemBuilder: (context, index) {
                  var e = controller.mBannerList.value[index];
                  return _gridViewWidget(e.imagePath, context, e.title);
                },
              );
            }),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.mTopJsonList.value.length,
                itemBuilder: (context, index) {
                  return _listTopWidget(
                      controller.mTopJsonList.value[index], context);
                },
              );
            }),
            Obx(() {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.mFriendJsonList.value.length,
                itemBuilder: (context, index) {
                  return _listFriendWidget(
                      controller.mFriendJsonList.value[index], context);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 5,
                    indent: 0,
                    color: Color(0xFFDDDDDD),
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _bannerWidget(String imagePath, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:
            DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.fill),
      ),
    );
  }

  Widget _gridViewWidget(
      String imagePath, BuildContext context, String content) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 90.0,
        margin: const EdgeInsets.only(top: 10, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Positioned(
        bottom: 10.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 20.0,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 5.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            color: Colors.black26,
          ),
          child: Text(
            content,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _listTopWidget(TopJsonEntity entity, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      padding: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: Row(
        children: [
          Image.asset(
            'images/icon_open.png',
            fit: BoxFit.fill,
            width: 100.0,
            height: 100.0,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entity.title,
                  softWrap: true,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  entity.niceShareDate,
                  softWrap: true,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listFriendWidget(FriendJsonEntity entity, BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              'images/icon_open.png',
              fit: BoxFit.fill,
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entity.name,
                    softWrap: true,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    entity.category,
                    softWrap: true,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),

                ],
              ),
            ),
            GestureDetector(
              child: const Text(
                "收藏",
                softWrap: true,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              onTap: (){
                CollectAddJson.addCollect(entity.name, "test", entity.link);
              },
            ),
          ],

        ),
      ),
      onTap: (){
        Get.toNamed(WEBVIEW_VIEW, arguments: {"url":entity.link,"name":entity.name});
      },
    );
  }

  Future _onRefresh() async {
    controller.onRefresh();
  }
}
