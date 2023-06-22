import 'package:flutter/material.dart';
import 'package:flutter01/pages/form.dart';
import 'package:flutter01/pages/search.dart';

import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            // 点击该按钮时，跳转至search页面
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  // 在builder中传入function
                  builder: (BuildContext context) {
                return const SearchPage();
              }));
            },
            child: const Text("Search - 基本路由跳转"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // 使用Navigator.pushNamed进行命名路由跳转
                // 第一个参数context，第二个参数为路由内容
                Navigator.pushNamed(context, "/search");
              },
              child: const Text("Search - 命名路由跳转")),
          const SizedBox(
            height: 20,
          ),
          // 跳转传值
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return FormPage(
                  title: "我的表单",
                  count: 1554,
                );
              }));
            },
            child: const Text("form - 普通路由传值"),
          ),
          const SizedBox(
            height: 20,
          ),
          // 命名路由传值
          ElevatedButton(
            onPressed: () => {
              // Navigator.pushNamed(context, "/news",
              //     arguments: {"title": "我是命名路由传值", "UID": "9998"})

              // // GetX命名路由传值
              Get.toNamed("/news",
                  arguments: {"title": "我是命名路由传值", "UID": "9998"})
            },
            child: const Text("news - 命名路由传值"),
          ),
        ],
      ),
    );
  }
}
