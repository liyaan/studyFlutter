import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProjectInfoController extends  GetxController{
  final data = <String, dynamic>{}.obs;
  WebViewController webViewController = WebViewController();
  var progrss = 0.0.obs;
  var visible = true.obs;
  @override
  void onInit() {
    data.value = Get.arguments;
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnConsoleMessage((message) {
        print("message.level = ${message.level}  ${message.message}");
      })
      ..setNavigationDelegate(NavigationDelegate(
          onProgress: (value){
            progrss.value = value/100;
            print("value = $value");
          },
          onPageFinished: (url){
            visible.value = false;
          },
          onWebResourceError: (error){
            print("error = $error");
          }
      ))
      ..loadRequest(Uri.parse(data.value["link"]));
    super.onInit();
  }
}