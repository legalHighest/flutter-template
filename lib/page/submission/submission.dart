import 'package:flutter/material.dart';
import 'package:flutter_template_v3/generated/l10n.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({super.key});

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.submission),
        centerTitle: true,
        leading: const Text(""),
      ),
      body: const Center(
        child: Text("投稿页"),
      ),
    );
  }
}
