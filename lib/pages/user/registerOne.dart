import 'package:flutter/material.dart';
import 'package:flutter01/pages/user/registerTwo.dart';

import 'package:get/get.dart';

class RegisterOnePage extends StatefulWidget {
  const RegisterOnePage({super.key});

  @override
  State<RegisterOnePage> createState() => _RegisterOnePageState();
}

class _RegisterOnePageState extends State<RegisterOnePage> {
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
          const Text("注册第一步"),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                // 通过pushNamed进行跳转，至注册第二步
                Navigator.pushNamed(context, "/registerTwo");
              },
              child: const Text("下一步"))
        ],
      )),
    );
  }
}
