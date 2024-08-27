import 'dart:convert';


class NaviJsonEntity {
	List<NaviJsonArticles> articles;
	int cid;
	String name;

	NaviJsonEntity.fromMap(Map<String, dynamic> json) :
		articles = (json['articles'] as List?)?.map((e) => NaviJsonArticles.fromMap(e)).toList() ?? [],
		cid = json['cid'] ?? 0,
		name = json['name'] ?? '';

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['articles'] =  articles.map((v) => v.toMap()).toList();
		data['cid'] = cid;
		data['name'] = name;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<NaviJsonEntity> formList(dynamic data, [String? sub]) {
		var ll = <NaviJsonEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(NaviJsonEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static NaviJsonEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return NaviJsonEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}

class NaviJsonArticles {
	bool adminAdd;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	int courseId;
	bool fresh;
	int id;
	bool isAdminAdd;
	String link;
	String niceDate;
	String niceShareDate;
	int publishTime;
	String title;

	NaviJsonArticles.fromMap(Map<String, dynamic> json) :
		adminAdd = json['adminAdd'] ?? false,
		audit = json['audit'] ?? 0,
		author = json['author'] ?? '',
		canEdit = json['canEdit'] ?? false,
		chapterId = json['chapterId'] ?? 0,
		chapterName = json['chapterName'] ?? '',
		courseId = json['courseId'] ?? 0,
		fresh = json['fresh'] ?? false,
		id = json['id'] ?? 0,
		isAdminAdd = json['isAdminAdd'] ?? false,
		link = json['link'] ?? '',
		niceDate = json['niceDate'] ?? '',
		niceShareDate = json['niceShareDate'] ?? '',
		publishTime = json['publishTime'] ?? 0,
		title = json['title'] ?? '';

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['adminAdd'] = adminAdd;
		data['audit'] = audit;
		data['author'] = author;
		data['canEdit'] = canEdit;
		data['chapterId'] = chapterId;
		data['chapterName'] = chapterName;
		data['courseId'] = courseId;
		data['fresh'] = fresh;
		data['id'] = id;
		data['isAdminAdd'] = isAdminAdd;
		data['link'] = link;
		data['niceDate'] = niceDate;
		data['niceShareDate'] = niceShareDate;
		data['publishTime'] = publishTime;
		data['title'] = title;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<NaviJsonArticles> formList(dynamic data, [String? sub]) {
		var ll = <NaviJsonArticles>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(NaviJsonArticles.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static NaviJsonArticles? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return NaviJsonArticles.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
