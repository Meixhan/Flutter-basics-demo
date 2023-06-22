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
      // 配置主题颜色
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const MyList(),
        const ListTile(
          // 最左侧的图标
          leading: Icon(
            Icons.home,
            color: Colors.blueGrey,
          ),
          title: Text("Home"),
        ),
        const Divider(), // 一根分割线
        const ListTile(
          leading: Icon(
            Icons.assignment,
            color: Color.fromARGB(255, 151, 91, 133),
          ),
          title: Text("My Orders"),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(
            Icons.payment,
            color: Color.fromARGB(174, 75, 72, 218),
          ),
          title: Text("Payment"),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          // 最右侧
          trailing: Icon(Icons.arrow_forward),
        ),
        const Divider(),
        ListTile(
          leading: Image.asset("images/pic1.png"),
          title: const Text("原批万岁！"),
          subtitle: const Text("哒哒哒~"),
        ),
        Image.asset("images/pic1.png"),
        Image.asset("images/pic1.png"),
        Image.asset("images/pic1.png"),
        Image.asset("images/pic1.png"),
        Container(
          alignment: Alignment.center,
          height: 44,
          child: const Text("已经到底部了~"),
        )
      ],
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    // 利用SizedBox控制高度
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            // 水平分布的时候，设置高度height是没有用的
            height: 120,
            // 垂直分布的时候，设置宽度width是没有效果的
            width: 120,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.red),
            child: const Text(
              "1",
              style: TextStyle(fontSize: 36),
            ),
          ),
          Container(
            width: 120,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.yellow),
            child: const Text(
              "2",
              style: TextStyle(fontSize: 36),
            ),
          ),
          Container(
            width: 120,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Text(
              "3",
              style: TextStyle(fontSize: 36),
            ),
          ),
          Container(
            width: 120,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.green),
            child: const Text(
              "4",
              style: TextStyle(fontSize: 36),
            ),
          ),
        ],
      ),
    );
  }
}
