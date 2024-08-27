import 'package:study_flutter/bean/banner_entity.dart';
import 'package:study_flutter/bean/friend_json_entity.dart';
import 'package:study_flutter/bean/hot_entity.dart';
import 'package:study_flutter/bean/project_tree_json_entity.dart';
import 'package:study_flutter/bean/top_json_entity.dart';
import 'package:study_flutter/bean/tree_json_entity.dart';

import '../article_list_entity.dart';
import '../collect_add_entity.dart';
import '../login_json_entity.dart';
import '../navi_json_entity.dart';
import '../project_list_json_entity.dart';

JsonConvert jsonConvert = JsonConvert();

class JsonConvert {

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }
  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
		final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type ==  "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type ==  "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return JsonConvert.fromJsonAsT<T>(value);
      }
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return null;
    }
  } 
	//Go back to a single instance by type
	static M? _fromJsonSingle<M>(Map<String, dynamic> json) {
		final String type = M.toString();
		// if(type == (Article).toString()){
		// 	return Article.fromJson(json) as M;
		// }
		// if(type == (LoginParams).toString()){
		// 	return LoginParams.fromJson(json) as M;
		// }
		// if(type == (PagingParams).toString()){
		// 	return PagingParams.fromJson(json) as M;
		// }
		// if(type == (SchoolEntity).toString()){
		// 	return SchoolEntity.fromJson(json) as M;
		// }
		// if(type == (UserEntity).toString()){
		// 	return UserEntity.fromJson(json) as M;
		// }
    if(type == (ArticleListEntity).toString()){
      return ArticleListEntity.parseJson(json) as M;
    }
    if(type == (ProjectListJsonEntity).toString()){
      return ProjectListJsonEntity.parseJson(json) as M;
    }
    if(type == (LoginJsonEntity).toString()){
      return LoginJsonEntity.parseJson(json) as M;
    }
    if(type == (CollectAddEntity).toString()){
      return CollectAddEntity.parseJson(json) as M;
    }
		print("$type not found");
	
		return null;
}

  //list is returned by type
	static M? _getListChildType<M>(List<dynamic> data) {
		if(<String>[] is M){
			return data.map<String?>((e) => jsonConvert.convert<String>(e)).where((element) => element != null).map((e) => e as String).toList() as M;
		}
		if(<int>[] is M){
			return data.map<int?>((e) => jsonConvert.convert<int>(e)).where((element) => element != null).map((e) => e as int).toList() as M;
		}
		if(<double>[] is M){
			return data.map<double?>((e) => jsonConvert.convert<double>(e)).where((element) => element != null).map((e) => e as double).toList() as M;
		}
		if(<bool>[] is M){
			return data.map<bool?>((e) => jsonConvert.convert<bool>(e)).where((element) => element != null).map((e) => e as bool).toList() as M;
		}
		if(<DateTime>[] is M){
			return data.map<DateTime?>((e) => jsonConvert.convert<DateTime>(e)).where((element) => element != null).map((e) => e as DateTime).toList() as M;
		}
		if(<HotEntity>[] is M){
			return data.map<HotEntity>((e) => HotEntity.fromMap(e)).toList() as M;
		}
    if(<BannerEntity>[] is M){
      return data.map<BannerEntity>((e) => BannerEntity.fromMap(e)).toList() as M;
    }
    if(<TopJsonEntity>[] is M){
      return data.map<TopJsonEntity>((e) => TopJsonEntity.fromMap(e)).toList() as M;
    }
    if(<FriendJsonEntity>[] is M){
      return data.map<FriendJsonEntity>((e) => FriendJsonEntity.fromMap(e)).toList() as M;
    }
    if(<TreeJsonEntity>[] is M){
      return data.map<TreeJsonEntity>((e) => TreeJsonEntity.fromMap(e)).toList() as M;
    }
    if(<NaviJsonEntity>[] is M){
      return data.map<NaviJsonEntity>((e) => NaviJsonEntity.fromMap(e)).toList() as M;
    }
    if(<ProjectTreeJsonEntity>[] is M){
      return data.map<ProjectTreeJsonEntity>((e) => ProjectTreeJsonEntity.fromMap(e)).toList() as M;
    }
		// if(<LoginParams>[] is M){
		// 	return data.map<LoginParams>((e) => LoginParams.fromJson(e)).toList() as M;
		// }
		// if(<PagingParams>[] is M){
		// 	return data.map<PagingParams>((e) => PagingParams.fromJson(e)).toList() as M;
		// }
		// if(<SchoolEntity>[] is M){
		// 	return data.map<SchoolEntity>((e) => SchoolEntity.fromJson(e)).toList() as M;
		// }
		// if(<UserEntity>[] is M){
		// 	return data.map<UserEntity>((e) => UserEntity.fromJson(e)).toList() as M;
		// }

		print("${M.toString()} not found");
	
		return null;
}

  static M? fromJsonAsT<M>(dynamic json) {
		if(json == null){
			return null;
		}		if (json is List) {
			return _getListChildType<M>(json);
		} else {
			return _fromJsonSingle<M>(json as Map<String, dynamic>);
		}
	}
}