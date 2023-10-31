import 'package:flutter_template_v3/core/http/http.dart';

class LoginService {
  /// 登陆
  static Future login(Map<String, dynamic> params) async {
    var response = await XHttp.post("login", params);
    return response.data;
  }
}
