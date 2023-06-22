// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

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
  // 定义一个global key给animated list
  // 必须在范型里传入AnimatedListState，用于后续调用方法
  final GlobalKey<AnimatedListState> _globalKey = GlobalKey();
  List<String> list = ["Alice", "Bob"];

  // 定义一个flag， 默认为true，解决狂按删除时的冲突
  bool flag = true;

  Widget _buildItem(index) {
    return ListTile(
      key: ValueKey(index),
      title: Text(list[index]),
      trailing: IconButton(
        onPressed: () {
          // 执行删除
          _deleteItem(index);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }

  _deleteItem(index) {
    // 类似于一个锁
    if (flag == true) {
      flag = false;
      print("删除索引$index");
      // 增加的时候只需要传入index，删除的时候还需要传context和animation
      _globalKey.currentState!.removeItem(index, (context, animation) {
        // 先获取要删除的元素
        var removedItem = _buildItem(index);
        list.removeAt(index);
        return ScaleTransition(
          scale: animation, // animation的值从1到0
          // 执行动画的元素
          child: removedItem,
        );
      });
      // 删除时有个动画时间
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedList"),
      ),
      body: AnimatedList(
          // 指定它的key
          key: _globalKey,
          // 初始化的数量
          initialItemCount: list.length,
          // 类似于ListView的itemBuilder
          // 传三个参数，除context和index外，还有一个动画效果animation
          itemBuilder: (context, index, animation) {
            // 只有在删除和添加元素的时候才会执行动画
            return FadeTransition(
              opacity: animation,
              child: _buildItem(index),
            );
            // return ScaleTransition(
            //   scale: animation,
            //   child: _buildItem(index),
            // );
          }),
      // 点击按钮增加一个数据
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // 往list里增加数据，但是animated list里没反应
            list.add("Peter");
            // 通过.currentState获取AnimatedList对应的state
            // 传入的新index是插入后的长度-1
            _globalKey.currentState!.insertItem(list.length - 1);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
