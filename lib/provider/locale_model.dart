import 'package:flutter/material.dart';
import 'package:flutter_template_v3/common/constant.dart';
import 'package:flutter_template_v3/generated/l10n.dart';
import 'package:flutter_template_v3/utils/sp_utils.dart';

/// 字符串资源
class LocaleModel extends ChangeNotifier {
  Locale get value => _locale;

  Locale _locale = const Locale('zh', 'CN');

  // 中文（默认）
  static const String languageCN = 'zh_CN';

  // 英文
  static const String languageEN = 'en_US';

  /// 初始化
  init() {
    String language = SpUtils.instance.get(Constant.LANGUAGE_KEY, languageCN)!;
    if (language == languageCN) {
      // 中文
      _locale = const Locale('zh', 'CN');
    } else if (language == languageEN) {
      // 英文
      _locale = const Locale('en', 'US');
    }
  }

  /// 设置语言
  setLocale(Locale locale, String language) {
    _locale = locale;
    SpUtils.instance.setData(Constant.LANGUAGE_KEY, language);
    notifyListeners();
  }

  /// 获取实例
  static S create() {
    return S.current;
  }
}
