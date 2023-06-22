// 基础组件 importM: import material package
import 'package:flutter/material.dart';

// 我们需要把内容单独抽离成一个组件
// 继承StatelessWidget或StatefulWidget
void main() {
  // 目前所有的应用都使用MaterialApp包裹
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Hello Flutter")),
      body: const MyApp(),
    ),
  ));
}

// 自定义组件MyApp，静态组件，重写一个build方法
// statelessW
class MyApp extends StatelessWidget {
  // 需要有一个key
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 返回臃肿的Center组件
    return const Center(
      child: Text("Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 28, color: Colors.purpleAccent)),
    );
  }
}
