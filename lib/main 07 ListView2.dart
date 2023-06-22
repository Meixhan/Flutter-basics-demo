// 基础组件 importM: import material package
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
        body: const MyList(),
      ),
    );
  }
}

// 动态生成列表的两种方法
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // 定义一个方法，返回widget list
  // 私有方法，外部无法调用
  List<Widget> _initListData() {
    List<Widget> list = [];
    // for 循环生成
    // for (Map item in listData) {
    //   list.add(ListTile(
    //     leading: Image.asset(item["imageUrl"]),
    //     title: Text(item["title"]),
    //     subtitle: Text(item["description"]),
    //   ));
    // }

    // map 生成
    list = listData
        .map((e) => ListTile(
              leading: Image.asset(e["imageUrl"]),
              title: Text(e["title"]),
              subtitle: Text(e["description"]),
            ))
        .toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: _initListData());
  }
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    // 必须传入两个参数
    // itemCount为数据数量
    // itemBuilder是一个function，传入上下文和index，返回一个widget
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(listData[index]["imageUrl"]),
          title: Text(listData[index]["title"]),
          subtitle: Text(listData[index]["description"]),
        );
      },
    );
  }
}

List listData = [
  {"title": "原批万岁", "description": "哒哒哒~", "imageUrl": 'images/pic1.png'},
  {"title": "原批万岁", "description": "略略略~", "imageUrl": 'images/pic1.png'},
  // {"title": "原批万岁", "description": "嘻嘻嘻~", "imageUrl": 'images/pic1.png'},
  // {"title": "原批万岁", "description": "懂你意思", "imageUrl": 'images/pic1.png'},
  // {"title": "原批万岁", "description": "哇哦~", "imageUrl": 'images/pic1.png'},
  // {"title": "原批万岁", "description": "嘿嘿嘿~", "imageUrl": 'images/pic1.png'},
];
