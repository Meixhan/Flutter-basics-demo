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
        body: const MyHomePage5(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 层叠组件，即可以叠起来放
    return Stack(
      // 越往前的内容摆在越底部
      children: [
        Container(
          height: 400,
          width: 300,
          color: Colors.pink,
        ),
        Container(
          height: 300,
          width: 200,
          color: Colors.yellow,
        ),
        const Text("DATA"),
      ],
    );
  }
}

// 指定组件的相对位置
class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Colors.blueAccent,
      // 如果这个Stack外层没有再包一个Container
      // 那么Positioned的位置就是相对于整个屏幕
      child: Stack(
        children: [
          // 在Container外层包一个Positioned组件
          Positioned(
            // 相对位置属性写在child之前
            left: 20,
            top: 20,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.pink,
            ),
          ),
          const Positioned(
              left: 100,
              bottom: 40,
              child: Text(
                "DATA",
                style: TextStyle(fontSize: 40),
              ))
        ],
      ),
    );
  }
}

// 固定在顶部的浮动窗口
class MyHomePage3 extends StatelessWidget {
  const MyHomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度
    final size = MediaQuery.of(context).size;
    // print(size);  // Size(360.0, 784.0)
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: ListView(
            children: const [
              ListTile(
                title: Text("派蒙真可爱~"),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              ),
              ListTile(
                title: Text("This is a list."),
              )
            ],
          ),
        ),
        Positioned(
          // Positioned 里不支持 double.infinity，需要专门去获取屏幕宽度
          // 如果里面子元素是个Row或Column，需要配置宽度高度
          width: size.width,
          child: Container(
            width: double.infinity,
            child: Image.asset("images/pic1.png"),
          ),
        )
      ],
    );
  }
}

// Align组件
class MyHomePage4 extends StatelessWidget {
  const MyHomePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.amber,
      // Center组件是Align的子组件
      child: const Align(
        alignment: Alignment(-0.5, 0), // (0,0)表示正中间
        child: Text("Hello Flutter"),
      ),
    );
  }
}

//
class MyHomePage5 extends StatelessWidget {
  const MyHomePage5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Stack(
            children: [
              // 也可以通过Positioned来实现
              Align(
                alignment: Alignment.centerLeft,
                child: Text("LEFT"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("RIGHT"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
