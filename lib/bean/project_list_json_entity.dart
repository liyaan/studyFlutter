import 'dart:convert';

class ProjectListJsonEntity {
	int curPage = 0;
	List<ProjectListJsonDatas> datas= [];
	int offset = 0;
	bool over = false;
	int pageCount = 0;
	int size = 0;
	int total = 0;
	ProjectListJsonEntity();
	ProjectListJsonEntity.fromMap(Map<String, dynamic> json) :
		curPage = json['curPage'] ?? 0,
		datas = (json['datas'] as List?)?.map((e) => ProjectListJsonDatas.fromMap(e)).toList() ?? [],
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
	static List<ProjectListJsonEntity> formList(dynamic data, [String? sub]) {
		var ll = <ProjectListJsonEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(ProjectListJsonEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static ProjectListJsonEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return ProjectListJsonEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}

class ProjectListJsonDatas {
	bool adminAdd;
	String apkLink;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	bool collect;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	String host;
	int id;
	bool isAdminAdd;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	int publishTime;
	int realSuperChapterId;
	int selfVisible;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	List<ProjectListJsonDatasTags> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;

	ProjectListJsonDatas.fromMap(Map<String, dynamic> json) :
		adminAdd = json['adminAdd'] ?? false,
		apkLink = json['apkLink'] ?? '',
		audit = json['audit'] ?? 0,
		author = json['author'] ?? '',
		canEdit = json['canEdit'] ?? false,
		chapterId = json['chapterId'] ?? 0,
		chapterName = json['chapterName'] ?? '',
		collect = json['collect'] ?? false,
		courseId = json['courseId'] ?? 0,
		desc = json['desc'] ?? '',
		descMd = json['descMd'] ?? '',
		envelopePic = json['envelopePic'] ?? '',
		fresh = json['fresh'] ?? false,
		host = json['host'] ?? '',
		id = json['id'] ?? 0,
		isAdminAdd = json['isAdminAdd'] ?? false,
		link = json['link'] ?? '',
		niceDate = json['niceDate'] ?? '',
		niceShareDate = json['niceShareDate'] ?? '',
		origin = json['origin'] ?? '',
		prefix = json['prefix'] ?? '',
		projectLink = json['projectLink'] ?? '',
		publishTime = json['publishTime'] ?? 0,
		realSuperChapterId = json['realSuperChapterId'] ?? 0,
		selfVisible = json['selfVisible'] ?? 0,
		shareDate = json['shareDate'] ?? 0,
		shareUser = json['shareUser'] ?? '',
		superChapterId = json['superChapterId'] ?? 0,
		superChapterName = json['superChapterName'] ?? '',
		tags = (json['tags'] as List?)?.map((e) => ProjectListJsonDatasTags.fromMap(e)).toList() ?? [],
		title = json['title'] ?? '',
		type = json['type'] ?? 0,
		userId = json['userId'] ?? 0,
		visible = json['visible'] ?? 0,
		zan = json['zan'] ?? 0;

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['adminAdd'] = adminAdd;
		data['apkLink'] = apkLink;
		data['audit'] = audit;
		data['author'] = author;
		data['canEdit'] = canEdit;
		data['chapterId'] = chapterId;
		data['chapterName'] = chapterName;
		data['collect'] = collect;
		data['courseId'] = courseId;
		data['desc'] = desc;
		data['descMd'] = descMd;
		data['envelopePic'] = envelopePic;
		data['fresh'] = fresh;
		data['host'] = host;
		data['id'] = id;
		data['isAdminAdd'] = isAdminAdd;
		data['link'] = link;
		data['niceDate'] = niceDate;
		data['niceShareDate'] = niceShareDate;
		data['origin'] = origin;
		data['prefix'] = prefix;
		data['projectLink'] = projectLink;
		data['publishTime'] = publishTime;
		data['realSuperChapterId'] = realSuperChapterId;
		data['selfVisible'] = selfVisible;
		data['shareDate'] = shareDate;
		data['shareUser'] = shareUser;
		data['superChapterId'] = superChapterId;
		data['superChapterName'] = superChapterName;
		data['tags'] =  tags.map((v) => v.toMap()).toList();
		data['title'] = title;
		data['type'] = type;
		data['userId'] = userId;
		data['visible'] = visible;
		data['zan'] = zan;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<ProjectListJsonDatas> formList(dynamic data, [String? sub]) {
		var ll = <ProjectListJsonDatas>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(ProjectListJsonDatas.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static ProjectListJsonDatas? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return ProjectListJsonDatas.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}

class ProjectListJsonDatasTags {
	String name;
	String url;

	ProjectListJsonDatasTags.fromMap(Map<String, dynamic> json) :
		name = json['name'] ?? '',
		url = json['url'] ?? '';

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['name'] = name;
		data['url'] = url;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<ProjectListJsonDatasTags> formList(dynamic data, [String? sub]) {
		var ll = <ProjectListJsonDatasTags>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(ProjectListJsonDatasTags.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static ProjectListJsonDatasTags? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return ProjectListJsonDatasTags.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
