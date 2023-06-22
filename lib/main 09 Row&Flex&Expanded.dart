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
        body: const ImageCombination(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用padding组件实现padding，功能单一，相比Container占用内存小
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text("Hello Flutter"),
    );
  }
}

// 利用Row实现布局
class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity, // 占满外层容器
      color: Colors.greenAccent,
      child: Row(
        // 主轴显示方式，默认start，从最左边开始排
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 左右也有间距
        // 次轴显示方式，需要外部容器
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(Icons.abc, color: Colors.orange),
          IconContainer(Icons.bolt, color: Colors.yellow),
          IconContainer(Icons.piano, color: Colors.black),
        ],
      ),
    );
  }
}

// 利用Column实现布局
class MyHomePage3 extends StatelessWidget {
  const MyHomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity, // 占满外层容器
      color: Colors.greenAccent,
      child: Column(
        // 主轴显示方式，默认start，从最上方开始排
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 左右也有间距
        // 次轴显示方式，需要外部容器，center表示横向居中
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(Icons.abc, color: Colors.orange),
          IconContainer(Icons.bolt, color: Colors.yellow),
          IconContainer(Icons.piano, color: Colors.black),
        ],
      ),
    );
  }
}

// 使用Flex&Expanded实现弹性布局
// Row和Column都继承自Flex组件
class MyHomePage4 extends StatelessWidget {
  const MyHomePage4({super.key});

  @override
  Widget build(BuildContext context) {
    // Row也可以换成Flex，但需要配置direction为Axis.horizontal或vertical
    return Row(
      children: [
        Expanded(
          // flex的优先级比width高
          flex: 1, // 左侧的占1份
          child: IconContainer(Icons.abc, color: Colors.orange),
        ),
        Expanded(
          flex: 2, // 左侧的占2份
          child: IconContainer(Icons.bolt, color: Colors.yellow),
        ),
      ],
    );
  }
}

class MyHomePage5 extends StatelessWidget {
  const MyHomePage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconContainer(Icons.abc, color: Colors.orange),
        ),
        // 部分组件固定宽度，其他部分按比例排
        IconContainer(Icons.bolt, color: Colors.yellow),
      ],
    );
  }
}

class ImageCombination extends StatelessWidget {
  const ImageCombination({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: Image.asset("images/pic1.png", fit: BoxFit.cover)),
          // 可以继续利用SizedBox调整布局
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.asset(
                        "images/pic1.png",
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset("images/pic1.png",
                                  fit: BoxFit.cover)),
                          Expanded(
                              flex: 1,
                              child: Image.asset("images/pic1.png",
                                  fit: BoxFit.cover))
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}

// 自定义Icon，可以支持传参（自定义颜色和图标内容）
// ignore: must_be_immutable
class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;

  IconContainer(this.icon, {super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 100,
      color: color,
      child: Icon(
        icon,
        size: 48,
      ),
    );
  }
}
