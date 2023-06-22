import 'package:flutter/material.dart';
import 'package:flutter01/pages/tabs.dart';

import 'package:get/get.dart';

class RegisterThreePage extends StatefulWidget {
  const RegisterThreePage({super.key});

  @override
  State<RegisterThreePage> createState() => _RegisterThreePageState();
}

class _RegisterThreePageState extends State<RegisterThreePage> {
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
          const Text("注册第三步"),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                // 点击完成注册，返回根路由
                // 传两个参数，第一个是MaterialPageRoute，第二个返回false
                // 清空了目前为止的栈
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (BuildContext context) {
                //   return const MyNavigationBar(
                //     index: 4, // 用户tab
                //   );
                // }), (route) => false);

                // 使用GetX返回根路由
                Get.offAll(const MyNavigationBar(index: 4));
              },
              child: const Text("完成注册"))
        ],
      )),
    );
  }
}
