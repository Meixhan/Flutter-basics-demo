import 'package:flutter/material.dart';
import 'package:flutter01/pages/user/registerThree.dart';

import 'package:get/get.dart';

class RegisterTwoPage extends StatefulWidget {
  const RegisterTwoPage({super.key});

  @override
  State<RegisterTwoPage> createState() => _RegisterTwoPageState();
}

class _RegisterTwoPageState extends State<RegisterTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("注册第二步"),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                // 命名路由跳转
                // Navigator.pushNamed(context, "/registerThree");
                // 替换路由，点击下一步同样会去往第三步
                // 但是从第三步点返回的时候，会返回第一步
                // 原理是第三步页面替换了第二步，返回时等效于从第二步返回
                Navigator.of(context).pushReplacementNamed("/registerThree");

                // GetX使用新页面替换当前页面
                Get.off(const RegisterThreePage());
              },
              child: const Text("下一步"))
        ],
      )),
    );
  }
}
