import 'dart:convert';


class BannerEntity {
	String desc;
	int id;
	String imagePath;
	int isVisible;
	int order;
	String title;
	int type;
	String url;

	BannerEntity.fromMap(Map<String, dynamic> json) :
		desc = json['desc'] ?? '',
		id = json['id'] ?? 0,
		imagePath = json['imagePath'] ?? '',
		isVisible = json['isVisible'] ?? 0,
		order = json['order'] ?? 0,
		title = json['title'] ?? '',
		type = json['type'] ?? 0,
		url = json['url'] ?? '';

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['desc'] = desc;
		data['id'] = id;
		data['imagePath'] = imagePath;
		data['isVisible'] = isVisible;
		data['order'] = order;
		data['title'] = title;
		data['type'] = type;
		data['url'] = url;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<BannerEntity> formList(dynamic data, [String? sub]) {
		var ll = <BannerEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(BannerEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static BannerEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return BannerEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
