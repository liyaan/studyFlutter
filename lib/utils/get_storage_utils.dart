import 'package:get_storage/get_storage.dart';

import 'Const.dart';

class GetStorageUtils{
  static final GetStorage storageBox = GetStorage();

  static void writeData(String key, dynamic value){
    storageBox.write(key, value);
  }

  static dynamic readData(String key){
    return storageBox.read(key);
  }

  static dynamic removeData(String key){
     storageBox.remove(key);
  }

  static dynamic eraseData(){
    return storageBox.erase();
  }
  static bool isLogin() {
    dynamic value = GetStorageUtils.readData(Const.LOGIN_NAME);
    dynamic valuePsd = GetStorageUtils.readData(Const.LOGIN_PASSWORD);
    if (value == null || valuePsd==null) {
      return false;
    } else {
      String name = value;
      String psd = valuePsd;
      if (name.isNotEmpty && psd.isNotEmpty) {
        return true;
      }
      return false;
    }
  }
}