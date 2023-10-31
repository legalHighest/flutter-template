import 'package:flutter_template_v3/provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @author huzhuwei
class SpUtils {
  static SharedPreferences? _prefs;
  static SpUtils? _instance;

  static SpUtils get instance => _getInstance();

  SpUtils.of() {
    init();
  }

  SpUtils._pre(SharedPreferences prefs) {
    _prefs = prefs;
  }

  static SpUtils _getInstance() {
    _instance ??= SpUtils.of();
    return _instance!;
  }

  void init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<SpUtils> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = SpUtils._pre(prefs);
    }
    return _instance!;
  }

  void setData<T>(String key, T data) {
    if (data is String) {
      _prefs?.setString(key, data);
    } else if (data is double) {
      _prefs?.setDouble(key, data);
    } else if (data is int) {
      _prefs?.setInt(key, data);
    } else if (data is bool) {
      _prefs?.setBool(key, data);
    } else if (data is List<String>) {
      _prefs?.setStringList(key, data);
    }
  }

  void remove(String key) {
    _prefs?.remove(key);
  }

  T? get<T>(String key, T defaultValue) {
    var value = _prefs?.get(key);
    if (value != null) {
      return value as T;
    }
    return defaultValue;
  }

  /// 判断是否授权隐私协议
  static bool isAgreePrivacy() {
    return _instance!.get("key_agree_privacy", false)!;
  }

  ///是否已登陆
  static bool isLogined() {
    String token = _instance!.get("token", "")!;
    return token.isEmpty;
  }

  static String getLocale() {
    String locale = _instance!.get('key_locale', "cn")!;
    locale ??= LOCALE_FOLLOW_SYSTEM;
    return locale;
  }
}
