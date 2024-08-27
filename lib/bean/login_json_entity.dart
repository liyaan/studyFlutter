import 'dart:convert';


class LoginJsonEntity {
	String email;
	String password;
	String username;
	String icon;
	int id;
	int type;

	LoginJsonEntity.fromMap(Map<String, dynamic> json) :
		email = json['email'] ?? '',
		password = json['password'] ?? '',
		username = json['username'] ?? '',
		icon = json['icon'] ?? '',
		id = json['id'] ?? 0,
		type = json['type'] ?? 0;

	Map<String, dynamic> toMap() {
		final data = <String, dynamic>{};
		data['email'] = email;
		data['password'] = password;
		data['username'] = username;
		data['icon'] = icon;
		data['id'] = id;
		data['type'] = type;
		return data;
	}

	/// 解析数组json
	/// sub 解析data其子项
	/// sub == null, data 必须是数组的json
	/// sub != null, data 必须是map的json
	static List<LoginJsonEntity> formList(dynamic data, [String? sub]) {
		var ll = <LoginJsonEntity>[];

		try {
			var jsonArray;
			if (data is String) {
				jsonArray = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonArray = sub == null ? data : data[sub];
			}

			if (jsonArray != null) {
				for (var json in jsonArray) {
					ll.add(LoginJsonEntity.fromMap(json));
				}
			}
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return ll;
	}


	/// 解析对象json
	/// sub 解析data其子项
	static LoginJsonEntity? parseJson(data, [String? sub]) {
		if (data == null) return null;

		try {
			var jsonObj;
			if (data is String) {
				jsonObj = sub == null ? json.decode(data) : json.decode(data)[sub];
			} else {
				jsonObj = sub == null ? data : data[sub];
			}
			if (jsonObj != null) return LoginJsonEntity.fromMap(jsonObj);
		} catch (e) {
			print('json解析错误，错误类型：${e.runtimeType}');
		}

		return null;
	}
}
