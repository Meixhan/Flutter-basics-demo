import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: const MyHomePage2(),
      ),
    );
  }
}

// Wrap：单行的Wrap类似于Row，单列的Wrap类似于Column
// 主轴空间不足的时候自动向纵轴扩展
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Wrap(
        // 调整主轴，默认横轴
        direction: Axis.horizontal,
        alignment: WrapAlignment.center, // 默认情况相左对齐
        // 调整主轴方向上的间距
        spacing: 15,
        // 调整次轴方向上的间距
        runSpacing: 10,
        children: [
          CustomButton("第一集", onPressed: () {}),
          CustomButton("第二集", onPressed: () {}),
          CustomButton("第三集", onPressed: () {}),
          CustomButton("第四集", onPressed: () {}),
          CustomButton("第五集", onPressed: () {}),
          CustomButton("第六集", onPressed: () {}),
          CustomButton("第七集", onPressed: () {}),
          CustomButton("第八集", onPressed: () {}),
          CustomButton("第九集", onPressed: () {}),
          CustomButton("第十集", onPressed: () {}),
          CustomButton("第十一集", onPressed: () {}),
          CustomButton("第十二集", onPressed: () {})
        ],
      ),
    );
  }
}

// 电商网页搜索布局
class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(
            "热搜",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
          child: Wrap(
            spacing: 15,
            runSpacing: 5,
            children: [
              CustomButton("女装", onPressed: () {}),
              CustomButton("男装", onPressed: () {}),
              CustomButton("笔记本电脑", onPressed: () {}),
              CustomButton("玩具", onPressed: () {}),
              CustomButton("文具", onPressed: () {}),
              CustomButton("台灯", onPressed: () {}),
              CustomButton("纸巾", onPressed: () {})
            ],
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          title: Text(
            "历史记录",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Divider(),
        // 在ListView中不能直接嵌套ListView
        const Column(
          children: [
            ListTile(
              title: Text("OPPO reno 10"),
            ),
            ListTile(
              title: Text("iPhone 14 pro"),
            ),
          ],
        ),
        // 清空历史记录
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.grey)),
              icon: const Icon(Icons.delete),
              label: const Text("清空历史记录"),
            )
          ],
        )
      ],
    );
  }
}

// 自定义按钮组件
// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text; // 按钮文字
  void Function()? onPressed; // 点击事件
  CustomButton(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 216, 216, 216)),
            foregroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: onPressed,
        child: Text(text));
  }
}
