// 基础组件 importM: import material package
import 'package:flutter/material.dart';
import 'package:flutter01/customIcons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 配置主题颜色
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        // 内置图标
        Icon(
          Icons.home,
          size: 40,
          color: Colors.deepPurple,
        ),
        Icon(
          Icons.wechat,
          size: 40,
          color: Colors.green,
        ),
        SizedBox(
          height: 20,
        ),
        // 自定义的图标
        Icon(
          CustomIcons.book,
          size: 40,
          color: Colors.blueGrey,
        ),
        Icon(
          CustomIcons.aliPay,
          size: 40,
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}
