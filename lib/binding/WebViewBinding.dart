import 'package:get/get.dart';
import '../controller/WebViewOneController.dart';

class WebViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WebViewOneController());
  }
}