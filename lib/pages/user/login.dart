import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("登录跳转提示，执行登录后返回到上一个页面"),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                // 返回上个页面
                Navigator.of(context).pop();
                // 使用getX返回上个页面
                // Get.back();
              },
              child: const Text("执行登录"))
        ],
      )),
    );
  }
}
