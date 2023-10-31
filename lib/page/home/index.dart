import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template_v3/common/constant.dart';
import 'package:flutter_template_v3/generated/l10n.dart';
import 'package:flutter_template_v3/provider/locale_model.dart';
import 'package:flutter_template_v3/utils/event_bus.dart';
import 'package:flutter_template_v3/utils/sp_utils.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.index),
        centerTitle: true,
        leading: const Text(""),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Provider.of<LocaleModel>(context, listen: false).setLocale(
                    const Locale('en', 'US'), LocaleModel.languageEN);
              },
              child: const Text("切换英文"),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<LocaleModel>(context, listen: false).setLocale(
                    const Locale('zh', 'HK'), LocaleModel.languageCN);
              },
              child: const Text("切换中文"),
            ),
          ],
        ),
      ),
    );
  }

  /// eventbus使用
  void eventBus() {
    /// 发送事件
    EventBusUtil.fireEvent(CustomEvent(""));

    /// 订阅事件
    StreamSubscription subscription =
        EventBusUtil.addListener<CustomEvent>((event) {
      print("msg: ${event.msg}");
    });

    /// 取消订阅
    EventBusUtil.removeListener(subscription);
  }
}
