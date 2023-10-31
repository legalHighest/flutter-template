import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template_v3/common/constant.dart';
import 'package:flutter_template_v3/generated/l10n.dart';
import 'package:flutter_template_v3/page/login/login.dart';
import 'package:flutter_template_v3/provider/locale_model.dart';
import 'package:flutter_template_v3/provider/provider.dart';
import 'package:flutter_template_v3/router/routers.dart';
import 'package:flutter_template_v3/utils/channel_utils.dart';
import 'package:provider/provider.dart';

//默认App的启动
class DefaultApp {
  //运行app
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    initFirst().then((value) => runApp(Store.init(const MyApp())));
  }

  /// 必须要优先初始化的内容
  static Future<void> initFirst() async {
    ChannelUtils.instance.init();
    final router = FluroRouter();
    Routes.configureRoutes(router);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      ensureScreenSize: true,
      builder: (context, child) {
        return Consumer<LocaleModel>(
          builder: (context, locale, child) {
            locale.init;
            return MaterialApp(
              title: 'Flutter Project',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  appBarTheme:
                      AppBarTheme(backgroundColor: Constant.mainColor)),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: const [
                Locale("zh", 'CN'),
                Locale("en", 'US'),
              ],
              locale: locale.value,
              home: const LoginPage(),

              /// 全局注册
              onGenerateRoute: Routes.router!.generator,
            );
          },
        );
      },
    );
  }
}
