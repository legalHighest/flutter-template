import 'package:flutter/material.dart';
import 'package:flutter_template_v3/page/home.dart';
import 'package:flutter_template_v3/router/routers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Routes.router!.navigateTo(context, Routes.home);
              },
              child: Text("登陆"))),
    );
  }
}
