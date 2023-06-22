// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends StatefulWidget {
  // 接收命名路由跳转传值
  // final Map arguments;
  // const NewsPage({super.key, required this.arguments});

  // 使用GetX时，不需要定义arguments属性
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    // print(widget.arguments);

    // 通过getX跳转传值，使用Get.arguments拿到值
    print(Get.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("新闻页面"),
      ),
      body: const Center(
        child: Text("新闻页面"),
      ),
    );
  }
}
