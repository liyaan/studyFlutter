import 'dart:convert';

class ProjectTreeJsonEntity {
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;

	ProjectTreeJsonEntity.fromMap(Map<String, dynamic> json) :
		courseId = json['courseId'] ?? 0,
		id = json['id'] ?? 0,
		name = json['name'] ?? '',
		order = json['order'] ?? 0,
		parentChapterId = json['parentChapterId'] ?? 0;

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['courseId'] = courseId;
		data['id'] = id;
		data['name'] = name;
		data['order'] = order;
		data['parentChapterId'] = parentChapterId;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<ProjectTreeJsonEntity> formList(dynamic data, [String? sub]) {
		var ll = <ProjectTreeJsonEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(ProjectTreeJsonEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static ProjectTreeJsonEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return ProjectTreeJsonEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
