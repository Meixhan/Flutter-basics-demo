// 基础组件 importM: import material package
import 'package:flutter/material.dart';

// 入口方法
void main() {
  // 目前所有的应用都使用MaterialApp包裹
  runApp(MaterialApp(
    // Scaffold组件
    home: Scaffold(
      // appBar配置顶部导航
      // 使用const的好处：
      // 1. 多个相同实例共享同一个存储空间
      // 2. 代码改变重新build的时候，不会build const组件
      appBar: AppBar(title: const Text("Hello Flutter")),
      // appBar和body的值都是widget类型，，可以使用AppBar和Center
      body: const Center(
        // 外面加了const，里面不用加const
        // ltr表示文字从左向右排列
        child: Text("Hello Flutter",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 28,
                // color: Color.fromARGB(244, 244, 123, 11)
                color: Colors.lightBlueAccent)),
      ),
    ),
  ));
}
