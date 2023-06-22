// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// get
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 需要将 MaterialApp 改为 GetMaterialApp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _alertDialog(context) async {
    var result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示信息！"),
            content: const Text("确定要删除吗？"),
            actions: [
              TextButton(
                onPressed: () {
                  print("OK");
                  Navigator.of(context).pop("ok");
                },
                child: const Text("确定"),
              ),
              TextButton(
                onPressed: () {
                  print("Cancel");
                  Navigator.of(context).pop("cancel");
                },
                child: const Text("取消"),
              ),
            ],
          );
        });
    print("----------");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                _alertDialog(context);
              },
              child: const Text("Default Dialog")),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "提示信息", // 必填
                  middleText: "确定要删除吗?",
                  confirm: ElevatedButton(
                      onPressed: () {
                        print("OK");
                        // Navigator.of(context).pop("ok");
                        // getX中对路由也进行了封装，返回上个页面
                        Get.back();
                      },
                      child: const Text("确定")),
                  cancel: ElevatedButton(
                      onPressed: () {
                        print("Cancel");
                        Get.back();
                      },
                      child: const Text("取消")),
                );
              },
              child: const Text("GetX Default Dialog")),
          ElevatedButton(
              onPressed: () {
                // 弹出一个toast
                Get.snackbar(
                  "提示",
                  "请先登录",
                  snackPosition: SnackPosition.BOTTOM, // 位置
                  duration: const Duration(seconds: 4), // 持续时间
                );
              },
              child: const Text("GetX SnackBar")),
          ElevatedButton(
              onPressed: () {
                // 底部弹出框，bottomSheet支持范型
                Get.bottomSheet(Container(
                  // 白天模式下，底部框白底黑字，黑夜模式下，为黑底白字
                  color: Get.isDarkMode ? Colors.black38 : Colors.white,
                  height: 200,
                  child: Column(children: [
                    ListTile(
                      onTap: () {
                        // 切换主题至白天模式
                        Get.changeTheme(ThemeData.light());
                        Get.back();
                      },
                      leading: Icon(
                        Icons.wb_sunny_outlined,
                        color: Get.isDarkMode ? Colors.white : Colors.black87,
                      ),
                      title: Text(
                        "Day mode",
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black87),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                        Get.back();
                      },
                      leading: Icon(
                        Icons.sunny,
                        color: Get.isDarkMode ? Colors.white : Colors.black87,
                      ),
                      title: Text(
                        "Night mode",
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black87),
                      ),
                    )
                  ]),
                ));
              },
              child: const Text("GetX BottomSheet 切换主题")),
        ],
      )),
    );
  }
}
