

import 'package:json_annotation/json_annotation.dart';
import 'package:study_flutter/bean/hot_entity.dart';

import 'banner_entity.dart';
import 'json/json_convert_content.dart';

@JsonSerializable()
class BaseRes<T>{
  BaseRes(this.errorMsg, this.errorCode, this.data);

  late String errorMsg;
  late int errorCode;
  late T data;

  BaseRes.fromJson(Map<String, dynamic>? json) {
    if (json?['data'] != null && json?['data'] != 'null') {
      // if(<HotEntity>[] is T) {
      //   data = JsonConvert.fromJsonAsT<T>(json?['data'])as T;
      // }else if(<BannerEntity>[] is T) {
      //   data = JsonConvert.fromJsonAsT<T>(json?['data'])as T;
      // }
      data = JsonConvert.fromJsonAsT<T>(json?['data'])as T;
    }
    errorMsg = json?['errorMsg'];
    errorCode = json?['errorCode'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}