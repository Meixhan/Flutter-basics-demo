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
        body: const MyHomePage2(),
      ),
    );
  }
}

// AspectRatio
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 显示一个容器，宽度是屏幕宽度，高度是宽度一半
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        width: 120, // 这里写宽度没用
        color: Colors.amber,
      ),
    );
  }
}

// Card组件
class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // 通讯录卡片
        Card(
          margin: const EdgeInsets.all(10),
          // 阴影
          elevation: 10,
          // 圆角
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // 背景颜色
          color: Colors.lightBlueAccent,
          // 内部利用Column进行布局
          child: const Column(
            children: [
              ListTile(
                title: Text(
                  "Alice",
                  style: TextStyle(fontSize: 28),
                ),
                subtitle: Text("Software Engineer"),
              ),
              Divider(),
              ListTile(
                title: Text("Phone: 123 444 9999"),
              ),
              ListTile(
                title: Text("Address: Washington DC"),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // 图文卡片
        Card(
          margin: const EdgeInsets.all(10),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // 内部利用Column进行布局
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  "images/pic1.png",
                  // fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    "https://umd.edu/sites/umd.edu/files/Do_Good_0_0_0.png",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
                title: const Text("XXXXX"),
                subtitle: const Text("xxxxxxxxx"),
              ),
              const Divider(),
              const ListTile(
                // 使用CircleAvatar实现圆形图片
                leading: CircleAvatar(
                    radius: 30,
                    // 里面的背景图片不用设置宽度高度了
                    backgroundImage: NetworkImage(
                      "https://umd.edu/sites/umd.edu/files/Do_Good_0_0_0.png",
                    )),
                title: Text("XXXXX"),
                subtitle: Text("xxxxxxxxx"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
