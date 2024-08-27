import 'dart:convert';

class TopJsonEntity {
	String author;
	int chapterId;
	String chapterName;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	int id;
	bool isAdminAdd;
	String link;
	String niceDate;
	String niceShareDate;
	int publishTime;
	int realSuperChapterId;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	String title;

	TopJsonEntity.fromMap(Map<String, dynamic> json) :
		author = json['author'] ?? '',
		chapterId = json['chapterId'] ?? 0,
		chapterName = json['chapterName'] ?? '',
		courseId = json['courseId'] ?? 0,
		desc = json['desc'] ?? '',
		descMd = json['descMd'] ?? '',
		envelopePic = json['envelopePic'] ?? '',
		fresh = json['fresh'] ?? false,
		id = json['id'] ?? 0,
		isAdminAdd = json['isAdminAdd'] ?? false,
		link = json['link'] ?? '',
		niceDate = json['niceDate'] ?? '',
		niceShareDate = json['niceShareDate'] ?? '',
		publishTime = json['publishTime'] ?? 0,
		realSuperChapterId = json['realSuperChapterId'] ?? 0,
		shareDate = json['shareDate'] ?? 0,
		shareUser = json['shareUser'] ?? '',
		superChapterId = json['superChapterId'] ?? 0,
		superChapterName = json['superChapterName'] ?? '',
		title = json['title'] ?? '';

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['author'] = author;
		data['chapterId'] = chapterId;
		data['chapterName'] = chapterName;
		data['courseId'] = courseId;
		data['desc'] = desc;
		data['descMd'] = descMd;
		data['envelopePic'] = envelopePic;
		data['fresh'] = fresh;
		data['id'] = id;
		data['isAdminAdd'] = isAdminAdd;
		data['link'] = link;
		data['niceDate'] = niceDate;
		data['niceShareDate'] = niceShareDate;
		data['publishTime'] = publishTime;
		data['realSuperChapterId'] = realSuperChapterId;
		data['shareDate'] = shareDate;
		data['shareUser'] = shareUser;
		data['superChapterId'] = superChapterId;
		data['superChapterName'] = superChapterName;
		data['title'] = title;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<TopJsonEntity> formList(dynamic data, [String? sub]) {
		var ll = <TopJsonEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(TopJsonEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static TopJsonEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return TopJsonEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
