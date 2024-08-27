import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_flutter/binding/HomeBinding.dart';
import 'package:study_flutter/binding/HomeViewBinding.dart';
import 'package:study_flutter/binding/LoginBinding.dart';
import 'package:study_flutter/binding/MyBinding.dart';
import 'package:study_flutter/binding/NaviBinding.dart';
import 'package:study_flutter/binding/ProjectListBinding.dart';
import 'package:study_flutter/binding/ScrollViewHeaderBinding.dart';
import 'package:study_flutter/binding/StickSliverListBinding.dart';
import 'package:study_flutter/binding/SystemInfoViewBinding.dart';
import 'package:study_flutter/binding/SystemViewBinding.dart';
import 'package:study_flutter/binding/WebViewBinding.dart';
import 'package:study_flutter/home/home_get.dart';
import 'package:study_flutter/home/home_view.dart';
import 'package:study_flutter/info/project_info.dart';
import 'package:study_flutter/info/project_list_info.dart';
import 'package:study_flutter/my/scroll_view_header_view.dart';
import 'package:study_flutter/routes/AppRoutes.dart';
import 'package:study_flutter/utils/Const.dart';
import 'package:study_flutter/utils/get_storage_utils.dart';
import 'binding/ProjectInfoBinding.dart';
import 'binding/ProjectTabGridBinding.dart';
import 'binding/ProjectTabListBinding.dart';
import 'binding/ProjectTreeBinding.dart';
import 'binding/RegisterBinding.dart';
import 'binding/TabbarScrollViewBinding.dart';
import 'home/project_tree_view.dart';
import 'info/sysout_info.dart';
import 'info/webiew_info.dart';
import 'login/login_get.dart';
import 'login/register_get.dart';
import 'my/project_tab_view.dart';
import 'my/stick_sliver_list_view.dart';
import 'my/tabbar_scroll_page_view.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  // 在页面加载时调用
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // 状态栏背景颜色
    statusBarBrightness: Brightness.dark,
    // 状态栏亮度
    statusBarIconBrightness: Brightness.dark,
    // 状态栏图标亮度
    systemNavigationBarColor: Colors.red,
    // 导航栏背景颜色
    systemNavigationBarIconBrightness: Brightness.dark, // 导航栏图标亮度
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("${isLogin()}");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      initialRoute: isLogin() ? HOME : LOGIN,
      getPages: [
        GetPage(
          name: LOGIN,
          page: () => const LoginPageGetState(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: REGISTER,
          page: () => const RegisterPageGetState(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: HOME,
          page: () => const HomePageState(),
          bindings: [
            HomeBinding(),
            HomeViewBinding(),
            SystemViewBinding(),
            NaviBinding(),
            MyBinding()
          ],
        ),
        GetPage(
          name: SYSTEM_IFNO_VIEW,
          page: () => const SystemInfoViewPageState(),
          binding: SystemInfoViewBinding(),
        ),
        GetPage(
          name: PROJECT_TREE_VIEW,
          page: () => const ProjectTreePageState(),
          binding: ProjectTreeBinding(),
        ),
        GetPage(
          name: PROJECT_TREE_LIST_VIEW,
          page: () => const ProjectListViewPageState(),
          binding: ProjectListBinding(),
        ),
        GetPage(
          name: WEBVIEW_VIEW,
          page: () => const WebViewViewPageState(),
          binding: WebViewBinding(),
        ),
        GetPage(
          name: PROJECT_INFO_VIEW,
          page: () => const ProjectInfoViewPageState(),
          binding: ProjectInfoBinding(),
        ),
        GetPage(
          name: PROJECT_TAB_VIEW,
          page: () => const ProjectTabGridPageState(),
          bindings: [ProjectTabGridBinding(), ProjectTabListBinding()],
        ),
        GetPage(
          name: SCROLL_VIEW_TAB_VIEW,
          page: () => const ScrollViewHeaderPageState(),
          bindings: [ScrollViewHeaderBinding()],
        ),
        GetPage(
          name: TAB_BAR_VIEW_TAB_VIEW,
          page: () => const TabBarScrollViewHeaderPageState(),
          bindings: [TabbarScrollViewBinding()],
        ),
        GetPage(
          name: STICK_SLIVER_LIST_VIEW,
          page: () => const StickSliverListPageState(),
          bindings: [StickSliverListBinding()],
        )
      ],
    );
  }

  bool isLogin() {
    dynamic value = GetStorageUtils.readData(Const.LOGIN_NAME);
    if (value == null) {
      return false;
    } else {
      String name = value;
      if (name.isNotEmpty) {
        return true;
      }
      return false;
    }
  }
}
