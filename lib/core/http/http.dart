import 'dart:ffi';

import 'package:dio/dio.dart';

class XHttp {
  XHttp._internal();

  ///网络请求配置
  static final Dio dio = Dio(BaseOptions(
    baseUrl: "https://www.wanandroid.com",
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  ///初始化dio
  static void init() {
    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      print("请求之前,可配置请求头、公共参数");
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      print("响应之前");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print("错误之前");
      handleError(e);
      return handler.next(e);
    }));
  }

  ///error统一处理
  static void handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        print("连接超时");
        break;
      case DioExceptionType.sendTimeout:
        print("请求超时");
        break;
      case DioExceptionType.receiveTimeout:
        print("响应超时");
        break;
      case DioExceptionType.badResponse:
        print("出现异常");
        break;
      case DioExceptionType.cancel:
        print("请求取消");
        break;
      default:
        print("未知错误");
        break;
    }
  }

  ///get请求
  static Future get(String url, [Map<String, dynamic>? params]) async {
    Response response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  ///post 表单请求
  static Future post(String url, [Map<String, dynamic>? params]) async {
    Response response = await dio.post(url, queryParameters: params);
    return response.data;
  }

  ///post body请求
  static Future postJson(String url, [Map<String, dynamic>? data]) async {
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  /// 上传文件
  Future upload(String filePath, String url) async {
    Map<String, dynamic> map = Map();
    map['file'] = await MultipartFile.fromFile(filePath,
        filename: filePath.substring(filePath.indexOf(".")));

    /// 构建formData
    FormData formData = FormData.fromMap(map);

    /// 发送post
    try {
      Response response = await dio.post(
        url,
        data: formData,
        onSendProgress: (count, total) {
          print("当前的进度是 $count 总进度:$total");
        },
      );
      var data = response.data;
    } on DioException catch (e) {
      /// 捕捉异常信息
      handleError(e);
    }
  }

  ///下载文件
  static Future downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print((count / total * 100).toStringAsFixed(0) + "%");
      });
    } on DioException catch (e) {
      handleError(e);
    }
  }
}
