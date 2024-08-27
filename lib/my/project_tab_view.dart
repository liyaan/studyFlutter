import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bean/BaseRes.dart';
import '../bean/project_list_json_entity.dart';
import '../controller/ProjectTabGridController.dart';
import '../http/HttpHelper.dart';
import '../routes/AppRoutes.dart';
import '../utils/Const.dart';
import '../utils/ToastMsg.dart';
import '../view/AppBarView.dart';

class ProjectTabGridPageState extends GetView<ProjectTabGridController> {
  const ProjectTabGridPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: AppBarView(
            title: "项目列表",
            colorType: false,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.back();
                }),
            bottom: TabBar(
              tabs: controller.mProjectTreeJsonEntity.map((element) {
                return Text(element.name);
              }).toList(),
              isScrollable: true,
              padding: const EdgeInsets.all(5.0),
              indicatorColor: Colors.amber,
              automaticIndicatorColorAdjustment: true,
              indicatorWeight: 4,
              indicatorPadding: const EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.white,
              labelStyle: const TextStyle(
                //选中label的Style
                fontSize: 15,
              ),
              unselectedLabelColor: Colors.grey,
              //未选中label颜色
              unselectedLabelStyle: const TextStyle(
                  //未选中label的Style
                  fontSize: 15),
              controller: controller.tabController,
            ),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: controller.mProjectTreeJsonEntity.map((element) {
            return ProjectListPage(element.id);
          }).toList(),
        ),
      );
    });
  }
}

class ProjectListPage extends StatefulWidget {
  const ProjectListPage(this.cid, {super.key});

  final int cid;

  @override
  State<StatefulWidget> createState() => _ProjectListPageState(cid);
}

class _ProjectListPageState extends State<ProjectListPage> {
  _ProjectListPageState(this.cid);

  final int cid;
  int _currentPageIndex = 0;
  ProjectListJsonEntity entity = ProjectListJsonEntity();
  List<ProjectListJsonDatas> list = [];
  ScrollController scrollController = ScrollController(); //listview的控制器
  @override
  void initState() {
    super.initState();
    _getProjectListData();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 20) {
        print('滑动到了最底部');
        _onUpdate();
      }
    });
  }

  _getProjectListData() async {
    if (entity != null && list.isNotEmpty) {
      print("${entity.pageCount} $_currentPageIndex");
      if (_currentPageIndex >= entity.pageCount) {
        ToastMsg.show("没有更多数据");
        _currentPageIndex--;
        return;
      }
    }
    BaseRes<ProjectListJsonEntity>? res = await HttpHelper.instance?.getHttp(
        "${Const.PROJECT_TREE_LIST_JSON}$_currentPageIndex/json?cid=$cid", null,
        loading: false);
    if (res != null && res.errorCode == 0) {
      if (_currentPageIndex == 0) {
        if (list.isNotEmpty) list.clear();
      }
      setState(() {
        entity = res.data;
        list.addAll(res.data.datas);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: GridView.builder(
              itemCount: list.length,
              controller: scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9),
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return _listTv(list[index], context);
              },
            ),
            // child: ListView.builder(
            //   controller: scrollController,
            //   itemBuilder: (context, index) {
            //     return _listTv(list[index], context);
            //   },
            //   itemCount: list.length,
            // ),
          ),
        ),
      ],
    );
  }

  Future<void> _onRefresh() async {
    _currentPageIndex = 0;
    _getProjectListData();
  }

  void _onUpdate() {
    _currentPageIndex++;
    _getProjectListData();
  }

  Widget _listTv(ProjectListJsonDatas item, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(item.envelopePic), fit: BoxFit.fill)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0x99000000),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Text(
            item.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      onTap: () {
        Get.toNamed(PROJECT_INFO_VIEW, arguments: item.toMap());
      },
    );
  }

}
