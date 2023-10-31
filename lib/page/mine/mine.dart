import 'package:flutter/material.dart';
import 'package:flutter_template_v3/generated/l10n.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.mine),
        centerTitle: true,
        leading: const Text(""),
      ),
      body: const Center(
        child: Text("我的页面"),
      ),
    );
  }
}
