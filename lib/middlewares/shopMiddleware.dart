// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

// 所有中间件继承 GetMiddleware 类
class ShopMiddleware extends GetMiddleware {
  // 重定向
  @override
  RouteSettings? redirect(String? route) {
    print(route);
    // 没有权限跳转至登录页面
    return const RouteSettings(name: "/login", arguments: {});
  }
}
