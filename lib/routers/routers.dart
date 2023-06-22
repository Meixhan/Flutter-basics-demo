import 'package:flutter/material.dart';
// 配置ISO风格的路由
// import 'package:flutter/cupertino.dart';
// CupertinoPageRoute替换MaterialPageRoute
import 'package:flutter01/pages/form.dart';
import 'package:flutter01/pages/hero.dart';
import 'package:flutter01/pages/news.dart';
import 'package:flutter01/pages/search.dart';
import 'package:flutter01/pages/shop.dart';
import 'package:flutter01/pages/tabs.dart';
import 'package:flutter01/pages/user/login.dart';
import 'package:flutter01/pages/user/registerOne.dart';
import 'package:flutter01/pages/user/registerThree.dart';
import 'package:flutter01/pages/user/registerTwo.dart';

// 引入中间件
import 'package:flutter01/middlewares/shopMiddleware.dart';

import 'package:get/get.dart';

// 配置命名路由，Map结构
Map routes = {
  "/": (context) => const MyNavigationBar(),
  "/search": (context) => const SearchPage(),
  "/form": (context) => FormPage(count: 100),
  // newsPage里面必须传一个arguments
  // "/news": (context, {arguments}) => NewsPage(arguments: arguments),

  // User相关
  "/login": (context) => const LoginPage(),
  "/registerOne": (context) => const RegisterOnePage(),
  "/registerTwo": (context) => const RegisterTwoPage(),
  "/registerThree": (context) => const RegisterThreePage(),

  "/hero": (context, {arguments}) => HeroPage3(arguments: arguments),
};

// 配置onGenerateRoute
// 路由跳转时，触发该方法
// 方法设置为公有
var onGenerateRoute = (RouteSettings settings) {
  // settings里面主要有两个参数：name和arguments
  // name是路由名称，可空
  final String? name = settings.name;
  // 在Map中根据name获取对应的function
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      // arguments不为空（传入了arguments）
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      // arguments为空，直接跳转，相当于无传值的基本路由跳转
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null; // 方法为空直接返回空
};

// GetX路由配置，进行抽离
class AppPage {
  static final routers = [
    GetPage(name: "/", page: () => const MyNavigationBar()),
    GetPage(name: "/search", page: () => const SearchPage()),
    GetPage(
      name: "/form",
      page: () => FormPage(count: 100),
    ),
    GetPage(
        name: "/news",
        // 跳转页面时进行传值，这里不需要写{arguments}
        page: () => const NewsPage()),
    GetPage(name: "/login", page: () => const LoginPage()),
    GetPage(
        name: "/registerOne",
        page: () => const RegisterOnePage(),
        // 切换页面时的效果
        transition: Transition.circularReveal),
    GetPage(name: "/registerTwo", page: () => const RegisterTwoPage()),
    GetPage(name: "/registerThree", page: () => const RegisterThreePage()),

    // 跳转时使用中间件
    GetPage(
        name: "/shop",
        page: () => const ShopPage(),
        middlewares: [ShopMiddleware()])
  ];
}
