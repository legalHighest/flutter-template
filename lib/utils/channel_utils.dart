import 'package:flutter/services.dart';

class ChannelUtils {
  MethodChannel? methodChannel;

  static ChannelUtils? _instance;

  static ChannelUtils get instance => _getInstance();

  static ChannelUtils _getInstance() {
    _instance ??= ChannelUtils._internal();
    return _instance!;
  }

  /// 私有构造函数
  ChannelUtils._internal();

  void init({String channelName = "com.example.share_app"}) {
    methodChannel = MethodChannel(channelName);
  }

  /// 发送信息
  Future<dynamic> sendData(dynamic data, String methodName) async {
    var res = await methodChannel!.invokeMethod(methodName, data);
    return Future.value(res);
  }
}
