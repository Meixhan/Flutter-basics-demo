// 基础组件 importM: import material package
import 'package:flutter/material.dart';

// 我们需要把内容单独抽离成一个组件
// 继承StatelessWidget或StatefulWidget
void main() {
  // 目前所有的应用都使用MaterialApp包裹
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(title: const Text("Hello Flutter")),
        // 使用Column组件放多个元素
        body: const Column(
          children: [MyApp(), MyButton(), MyText()],
        )),
  ));
}

// 自定义组件MyApp，静态组件，重写一个build方法
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 由于Container不是常量构造函数，所以去掉const
    return Center(
      // Container容器相当于html里的div
      child: Container(
        alignment: Alignment.center, // 配置child的方位
        width: 200,
        height: 200,
        // 让组件进行移动
        // x为正表示向右移动，y为正表示向下移动
        transform: Matrix4.translationValues(10, 0, 0),
        // transform: Matrix4.rotationZ(0.2), // 以左上角为原点旋转
        // transform: Matrix4.skewY(10), // 倾斜
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
        // 使用Decoration的子类BoxDecoration
        // BoxDecoration是常量构造函数，但是受Border.all等影响不加const
        decoration: BoxDecoration(
            color: Colors.amber, // 背景颜色
            border: Border.all(
              color: Colors.black87, // 边框颜色
              width: 4, // 边框线条粗细
            ),
            // 配置圆角
            borderRadius: BorderRadius.circular(10),
            // boxShadow是一个list，配置阴影效果
            boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 10.0)],
            // 渐变色，从红色变黄色
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.yellow])),
        child: const Text(
          "Hello Flutter",
          style: TextStyle(color: Colors.purple, fontSize: 28),
        ),
      ),
    );
  }
}

// 使用Container实现一个按钮
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 200,
      height: 40,
      margin: const EdgeInsets.all(10), // container的外部边缘
      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0), // 内间距
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: const Text(
        "OK",
        style: TextStyle(color: Colors.black, fontSize: 26),
      ),
    );
  }
}

// Text组件
class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: const BoxDecoration(color: Colors.yellow),
      child: const Text(
        "Oh my god. Oh my god. Oh my god. Oh my god. Oh my god. Oh my god.",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis, // 溢出的部分显示...
        maxLines: 2, // 最多显示一行
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900, // 加粗显示
          color: Colors.redAccent,
          fontStyle: FontStyle.italic, // 倾斜
          letterSpacing: 2, // 字间距
          decoration: TextDecoration.underline, // 底部加线
        ),
      ),
    );
  }
}
