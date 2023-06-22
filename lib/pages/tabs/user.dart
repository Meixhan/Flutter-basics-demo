import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // 跳转登录界面
              // Navigator.pushNamed(context, "/login");
              // 使用getX跳转，不需要传context
              Get.toNamed("/login");
            },
            child: const Text("登录"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // 通过pushNamed进行跳转，至注册第一步
                // Navigator.pushNamed(context, "/registerOne");
                // 使用getX跳转
                Get.toNamed("/registerOne");
              },
              child: const Text("注册")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // 使用getX跳转
                Get.toNamed("/shop");
              },
              child: const Text("商城"))
        ],
      ),
    );
  }
}
