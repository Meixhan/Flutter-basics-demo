// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// 用于自定义对话框
import 'package:fluttertoast/fluttertoast.dart';

// 引入widgets文件夹下自定义的Dialog
import 'widgets/myDialog.dart';

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
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 将按钮事件方法单独抽出来，然后挂载在onPressed上
  // yes/no确认提示框
  void _alertDialog() async {
    // 必传两个参数：上下文对象context和builder方法
    // builder方法传入context，返回弹窗对象
    // showDialog返回值是异步类型Future，使用async和await获取值
    var result = await showDialog(
        context: context,
        builder: (context) {
          // AlertDialog，点击灰色区域关闭
          // 一般必传title和content
          return AlertDialog(
            title: const Text("提示信息"),
            content: const Text("派蒙可爱吗"),
            // 按钮组
            actions: [
              TextButton(
                  onPressed: () {
                    print("Yes");
                    // 点击后对话框消失，对话框本身也是一个页面
                    // pop()里的值就是返回值！
                    Navigator.of(context).pop("Cute!");
                  },
                  child: const Text("是")),
              TextButton(
                  onPressed: () {
                    print("No!");
                    Navigator.of(context).pop("Not Cute!");
                  },
                  child: const Text("不是"))
            ],
          );
        });
    print(result);
  }

  // 带选项的弹出框
  void _simpleDialog() async {
    var result = await showDialog(
        // 点击边框外灰色背景时，对话框是否会消失，默认为true
        barrierDismissible: false,
        context: context,
        builder: (context) {
          // 弹出一个选择框
          return SimpleDialog(
            title: const Text("请选择角色："),
            // children里放选项，每个child都是SimpleDialogOption
            children: [
              SimpleDialogOption(
                // 一般来说，onPressed写在child上面
                onPressed: () {
                  print("您已选择：派蒙");
                  // 选择后关闭弹窗
                  Navigator.of(context).pop("派蒙");
                },
                child: const Text("派蒙"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  print("您已选择：孙悟空");
                  Navigator.of(context).pop("齐天大圣");
                },
                child: const Text("齐天大圣"),
              ),
              const Divider(), // 可以放任意组件
              SimpleDialogOption(
                onPressed: () {
                  print("那就钝角");
                  Navigator.of(context).pop("钝角");
                },
                child: const Text("钝角"),
              ),
            ],
          );
        });
    print(result);
  }

  // 底部弹出框
  void _modalBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          // 外面包一个Container控制高度
          return Container(
            height: 220,
            alignment: Alignment.center,
            child: Column(
              children: [
                ListTile(
                  title: const Text("分享"),
                  // 点击触发的事件
                  onTap: () {
                    print("分享成功！");
                    Navigator.of(context).pop("share");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("收藏"),
                  onTap: () {
                    print("收藏成功！");
                    Navigator.of(context).pop("collect");
                  },
                ),
                const Divider(),
                ListTile(
                  title: Text("取消"),
                  onTap: () {
                    print("已取消");
                    Navigator.of(context).pop("cancel");
                  },
                ),
              ],
            ),
          );
        });
    print(result);
  }

  // flutter toast 示例
  void _toast() {
    Fluttertoast.showToast(
      msg: "提示信息",
      toastLength: Toast.LENGTH_LONG, // 显示时间，时间过了以后自动消失
      gravity: ToastGravity.TOP, // 显示的位置
      timeInSecForIosWeb: 1, // 显示时间，针对ISO和web
      backgroundColor: Colors.black, // 背景颜色
      textColor: Colors.white, // 字体颜色
      fontSize: 16.0, // 字体大小
    );
  }

  // 自定义弹出框
  void _myDialog() async {
    var result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return MyDialog(
            title: "提示！",
            content: "我是提示信息，嘻嘻",
            onTap: () {
              print("CLOSE");
              Navigator.pop(context, "closed");
            },
          );
        });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialogs"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _alertDialog, // 注册方法时不加括号，加了是调用
                child: const Text("alert弹出版 - AlertDialog")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _simpleDialog,
                child: const Text("select弹出版 - SimpleDialog")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _modalBottomSheet,
                child: const Text("ActionSheet底部弹出版 - showModalBottomSheet")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _toast,
              child: const Text("Toast"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _myDialog,
              child: const Text("自定义Dialog"),
            )
          ],
        ),
      ),
    );
  }
}
