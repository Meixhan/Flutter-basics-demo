// 基础组件 importM: import material package
import 'package:flutter/material.dart';
import 'package:flutter01/main%2007%20ListView2.dart';

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
        body: const MyHomePage5(),
      ),
    );
  }
}

// 使用GridView.count实现网格
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 通过命名构造函数，快速实现网格布局
    return GridView.count(
      // 一行放四个
      crossAxisCount: 4,
      children: const [
        Icon(Icons.alarm),
        Icon(Icons.abc),
        Icon(Icons.camera_alt),
        Icon(Icons.cake),
        Icon(Icons.circle),
        Icon(Icons.arrow_forward),
        Icon(Icons.shopify),
        Icon(Icons.bolt),
        Icon(Icons.key)
      ],
    );
  }
}

// 使用GridView.extent实现网格
class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    // 通过命名构造函数，快速实现网格布局
    return GridView.extent(
      // 元素的最大长度，但不一定就是这个值
      maxCrossAxisExtent: 40,
      children: const [
        Icon(Icons.alarm),
        Icon(Icons.abc),
        Icon(Icons.camera_alt),
        Icon(Icons.cake),
        Icon(Icons.circle),
        Icon(Icons.arrow_forward),
        Icon(Icons.shopify),
        Icon(Icons.bolt),
        Icon(Icons.key)
      ],
    );
  }
}

// ignore: must_be_immutable
class MyHomePage3 extends StatelessWidget {
  MyHomePage3({super.key});
  List<Widget> myList = [];

  List<Widget> _initGridViewData() {
    for (var i = 0; i < 4; i++) {
      myList.add(Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Text(
          "DATA $i",
          style: const TextStyle(fontSize: 24),
        ),
      ));
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10), // 和页面边界的间距
      crossAxisCount: 2,
      crossAxisSpacing: 10, // 水平间距
      mainAxisSpacing: 10, // 垂直间距
      childAspectRatio: 0.7, // 宽高比，默认为1
      children: _initGridViewData(),
    );
  }
}

class MyHomePage4 extends StatelessWidget {
  const MyHomePage4({super.key});

  List<Widget> _initGridViewData() {
    return listData
        .map((e) => Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.grey),
              child: Column(children: [
                Image.asset(e["imageUrl"]),
                const SizedBox(
                  height: 5,
                ),
                Text(e["description"])
              ]),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(5),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.37,
      children: _initGridViewData(),
    );
  }
}

class MyHomePage5 extends StatelessWidget {
  const MyHomePage5({super.key});

  @override
  Widget build(BuildContext context) {
    // 与ListView.builder类似
    return GridView.builder(
      // gridDelegate一般选用 SliverGridDelegateWithFixedCrossAxisCount
      // 或 SliverGridDelegateWithMaxCrossAxisExtent
      // 前者实现类似 GridView.count 的功能
      // 后者实现类似 GridView.extent 的功能
      padding: const EdgeInsets.all(5), // 在外面设置padding
      itemCount: listData.length, // 还需要传一个count
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.37,
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(children: [
            Image.asset(listData[index]["imageUrl"]),
            const SizedBox(
              height: 5,
            ),
            Text(listData[index]["description"])
          ]),
        );
      },
    );
  }
}
