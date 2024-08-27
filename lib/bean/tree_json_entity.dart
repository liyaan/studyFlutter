import 'dart:convert';

class TreeJsonEntity {
	List<TreeJsonChildren> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	int type;
	bool userControlSetTop;
	int visible;

	TreeJsonEntity.fromMap(Map<String, dynamic> json) :
		children = (json['children'] as List?)?.map((e) => TreeJsonChildren.fromMap(e)).toList() ?? [],
		courseId = json['courseId'] ?? 0,
		id = json['id'] ?? 0,
		name = json['name'] ?? '',
		order = json['order'] ?? 0,
		parentChapterId = json['parentChapterId'] ?? 0,
		type = json['type'] ?? 0,
		userControlSetTop = json['userControlSetTop'] ?? false,
		visible = json['visible'] ?? 0;

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['children'] =  children.map((v) => v.toMap()).toList();
		data['courseId'] = courseId;
		data['id'] = id;
		data['name'] = name;
		data['order'] = order;
		data['parentChapterId'] = parentChapterId;
		data['type'] = type;
		data['userControlSetTop'] = userControlSetTop;
		data['visible'] = visible;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<TreeJsonEntity> formList(dynamic data, [String? sub]) {
		var ll = <TreeJsonEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(TreeJsonEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static TreeJsonEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return TreeJsonEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}

class TreeJsonChildren {
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	int type;
	bool userControlSetTop;
	int visible;

	TreeJsonChildren.fromMap(Map<String, dynamic> json) :
		courseId = json['courseId'] ?? 0,
		id = json['id'] ?? 0,
		name = json['name'] ?? '',
		order = json['order'] ?? 0,
		parentChapterId = json['parentChapterId'] ?? 0,
		type = json['type'] ?? 0,
		userControlSetTop = json['userControlSetTop'] ?? false,
		visible = json['visible'] ?? 0;

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['courseId'] = courseId;
		data['id'] = id;
		data['name'] = name;
		data['order'] = order;
		data['parentChapterId'] = parentChapterId;
		data['type'] = type;
		data['userControlSetTop'] = userControlSetTop;
		data['visible'] = visible;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<TreeJsonChildren> formList(dynamic data, [String? sub]) {
		var ll = <TreeJsonChildren>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(TreeJsonChildren.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static TreeJsonChildren? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return TreeJsonChildren.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
