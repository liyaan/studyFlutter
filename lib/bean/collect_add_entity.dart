import 'dart:convert';
class CollectAddEntity {
	String author;
	int chapterId;
	String chapterName;
	int courseId;
	String desc;
	String envelopePic;
	int id;
	String link;
	String niceDate;
	String origin;
	int originId;
	int publishTime;
	String title;
	int userId;
	int visible;
	int zan;

	CollectAddEntity.fromMap(Map<String, dynamic> json) :
		author = json['author'] ?? '',
		chapterId = json['chapterId'] ?? 0,
		chapterName = json['chapterName'] ?? '',
		courseId = json['courseId'] ?? 0,
		desc = json['desc'] ?? '',
		envelopePic = json['envelopePic'] ?? '',
		id = json['id'] ?? 0,
		link = json['link'] ?? '',
		niceDate = json['niceDate'] ?? '',
		origin = json['origin'] ?? '',
		originId = json['originId'] ?? 0,
		publishTime = json['publishTime'] ?? 0,
		title = json['title'] ?? '',
		userId = json['userId'] ?? 0,
		visible = json['visible'] ?? 0,
		zan = json['zan'] ?? 0;

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['author'] = author;
		data['chapterId'] = chapterId;
		data['chapterName'] = chapterName;
		data['courseId'] = courseId;
		data['desc'] = desc;
		data['envelopePic'] = envelopePic;
		data['id'] = id;
		data['link'] = link;
		data['niceDate'] = niceDate;
		data['origin'] = origin;
		data['originId'] = originId;
		data['publishTime'] = publishTime;
		data['title'] = title;
		data['userId'] = userId;
		data['visible'] = visible;
		data['zan'] = zan;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<CollectAddEntity> formList(dynamic data, [String? sub]) {
		var ll = <CollectAddEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(CollectAddEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static CollectAddEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return CollectAddEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
