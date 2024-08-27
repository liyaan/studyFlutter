import 'dart:convert';

class HotEntity {
	int id;
	String link;
	String name;
	int order;
	int visible;

	HotEntity.fromMap(Map<String, dynamic> json) :
		id = json['id'] ?? 0,
		link = json['link'] ?? '',
		name = json['name'] ?? '',
		order = json['order'] ?? 0,
		visible = json['visible'] ?? 0;

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['id'] = id;
		data['link'] = link;
		data['name'] = name;
		data['order'] = order;
		data['visible'] = visible;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<HotEntity> formList(dynamic data, [String? sub]) {
		var ll = <HotEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(HotEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static HotEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return HotEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
