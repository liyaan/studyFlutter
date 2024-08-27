import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';

import '../bean/BaseRes.dart';
import '../routes/AppRoutes.dart';
import '../utils/ToastMsg.dart';
import '../utils/Const.dart';

class HttpHelper {

  static BaseOptions? options;
  static HttpHelper? httpHelper;

  CancelToken cancelToken = CancelToken();

  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static HttpHelper? get instance=>getInstance();
  static Dio? mDio;
  static HttpHelper? getInstance(){
    httpHelper ??= HttpHelper();
    return httpHelper;
  }
  static Dio? getDio() {
    final token = GetStorage().read('token');
    final loginUser = GetStorage().read(Const.LOGIN_NAME);
    final loginPassWord = GetStorage().read(Const.LOGIN_PASSWORD);
    final Map<String, dynamic> headerMap = {};
    if(loginUser!=null && loginPassWord!=null){
      headerMap.putIfAbsent("token", () => token);
      headerMap.putIfAbsent("Cookie", () => "loginUserName=$loginUser;loginUserPassword=$loginPassWord");
      print(headerMap.toString());
    }
    options = BaseOptions(
      baseUrl: Const.BASE_URL,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: headerMap,
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json
    );
    mDio = Dio(options);
    mDio?.interceptors.add(interceptorsWrapper());
    // mDio?.httpClientAdapter = IOHttpClientAdapter(
    //   createHttpClient: () {
    //     final client = HttpClient();
    //     // Config the client.
    //     client.findProxy = (uri) {
    //       // Forward all request to proxy "localhost:8888".
    //       // Be aware, the proxy should went through you running device,
    //       // not the host platform.
    //       return 'PROXY 192.168.0.191:8089';
    //     };
    //     // You can also create a new HttpClient for Dio instead of returning,
    //     // but a client must being returned here.
    //     return client;
    //   },
    // );

    return mDio;
  }
  static InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //continue
    },onResponse: (response, handler){
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          ToastMsg.show("当前登录已过期，请重新登录！");
          Future.delayed(const Duration(milliseconds: 1000), () {
            Get.offAllNamed(LOGIN);
          });
        }else if (e.response?.statusCode == 403) {
          ToastMsg.show("暂无权限访问，请联系管理员！");
        } else {
          ToastMsg.show("系统内部异常！");
        }
      }
      return handler.next(e);
    });
  }
  ///Get请求
  Future<BaseRes<T>> getHttp<T>(String url, parameters,{loading = true}) async {
    return await getResponse<T>(url, method: GET, parameters: parameters,loading:loading);
  }

  Future<BaseRes<T>> postHttp<T>(String url, parameters,{loading = true}) async {
    ///定义请求参数
    parameters = parameters ?? <String, dynamic>{};

    return await getResponse<T>(url, method: POST, parameters: parameters,loading:loading);
  }

  Future<BaseRes<T>> putHttp<T>(String url, parameters,{loading = true}) async {
    ///定义请求参数
    parameters = parameters ?? <String, dynamic>{};

    return await getResponse<T>(url, method: PUT, parameters: parameters,loading:loading);
  }

  Future<BaseRes<T>> deleteHttp<T>(String url, parameters,{loading = true}) async {
    ///定义请求参数
    parameters = parameters ?? <String, dynamic>{};
    return await getResponse<T>(url, method: DELETE, parameters: parameters,loading:loading);
  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath, onReceiveProgress) async {
    Response? response;
    try {
      response = await getDio()?.download(urlPath, savePath,
          onReceiveProgress: onReceiveProgress);
    } on DioError catch (e) {
      formatError(e);
    }
    return response?.data;
  }

  Future<BaseRes<T>> getResponse<T>(
      String url, {
        required String method,
        parameters,
        loading,
      }) async {
    //这里指定response自动转成map,不指定的话有可能是String类型
    Response<Map<String, dynamic>>? response;
    if(!loading) loading = true;

    if(loading) {
      ToastMsg.showLoading();
    }
    print("url = ${url}");
    switch (method) {
      case GET:
        response = await getDio()?.get(url,
            queryParameters: parameters ?? <String, dynamic>{});
        break;
      case PUT:
        response = await getDio()?.put(url,
            queryParameters: parameters ?? <String, dynamic>{});
        break;
      case DELETE:
        response = await getDio()?.delete(url,
            queryParameters: parameters ?? <String, dynamic>{});
        break;
      default:
        response =
        await getDio()?.post(url, data: parameters ?? <String, dynamic>{});
        break;
    }
    print("response = ${response.toString()}");
    // print("headers = ${response?.headers["set-cookie"]}");
    // response?.headers["set-cookie"]?.toList().forEach((element) {
    //   print("element = $element");
    // });
    if(loading) {
      ToastMsg.cancelLoading();
    }

    //200代表网络请求成功
    if (response?.statusCode == 200) {
      /// 将后台的data字段转成自己想要的数据/数据集,code根据后端实际返回进行判断访问结果

      BaseRes<T> bean = BaseRes.fromJson(response?.data);

      return bean;
    } else if (response?.statusCode == 401) {
      ToastMsg.show("当前登录已过期，请重新登录！");
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAllNamed(LOGIN);
      });
    } else if (response?.statusCode == 403) {
      ToastMsg.show("暂无权限访问，请联系管理员！");
    } else {
      ToastMsg.show("系统内部异常！");
    }

    throw Exception('${response?.statusCode}+${response?.statusMessage}');
  }

  void formatError(DioError e) {
    print(e.message);
  }

  /*
   * 取消请求
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}