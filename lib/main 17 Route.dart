// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// 引入routers，里面对路由进行了剥离
import './routers/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // 标题全局居中
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      // 初始化路由
      initialRoute: "/login",
      // 配置onGenerateRoute
      // 路由跳转时，触发该方法
      onGenerateRoute: onGenerateRoute,
      // 不在需要home，由"/"取代
      // home: const MyNavigationBar(),
    );
  }
}
