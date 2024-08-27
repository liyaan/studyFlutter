import 'dart:convert';

class ArticleListEntity {
	int curPage = 0;
	List<ArticleListDatas> datas = [];
	int offset = 0;
	bool over = false;
	int pageCount = 0;
	int size = 0;
	int total = 0;


	ArticleListEntity();

  ArticleListEntity.fromMap(Map<String, dynamic> json) :
		curPage = json['curPage'] ?? 0,
		datas = (json['datas'] as List?)?.map((e) => ArticleListDatas.fromMap(e)).toList() ?? [],
		offset = json['offset'] ?? 0,
		over = json['over'] ?? false,
		pageCount = json['pageCount'] ?? 0,
		size = json['size'] ?? 0,
		total = json['total'] ?? 0;

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['curPage'] = curPage;
		data['datas'] =  datas.map((v) => v.toMap()).toList();
		data['offset'] = offset;
		data['over'] = over;
		data['pageCount'] = pageCount;
		data['size'] = size;
		data['total'] = total;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<ArticleListEntity> formList(dynamic data, [String? sub]) {
		var ll = <ArticleListEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(ArticleListEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static ArticleListEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return ArticleListEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}

class ArticleListDatas {
	int chapterId;
	String chapterName;
	int courseId;
	int id;
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

	ArticleListDatas.fromMap(Map<String, dynamic> json) :
		chapterId = json['chapterId'] ?? 0,
		chapterName = json['chapterName'] ?? '',
		courseId = json['courseId'] ?? 0,
		id = json['id'] ?? 0,
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
		data['chapterId'] = chapterId;
		data['chapterName'] = chapterName;
		data['courseId'] = courseId;
		data['id'] = id;
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
	static List<ArticleListDatas> formList(dynamic data, [String? sub]) {
		var ll = <ArticleListDatas>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(ArticleListDatas.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static ArticleListDatas? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return ArticleListDatas.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
