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
      home: const MyHomePage8(),
    );
  }
}

// AnimatedContainer
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: Center(
        child: AnimatedContainer(
          // 必传参数：动画效果持续时间
          duration: const Duration(seconds: 1, microseconds: 500),
          width: flag ? 200 : 300,
          height: flag ? 200 : 300,
          // 位移
          transform: flag
              ? Matrix4.translationValues(0, 0, 0)
              // x为正，代表向右平移
              : Matrix4.translationValues(100, 0, 0),
          color: Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// 滑动侧边栏
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              ListTile(
                title: Text("I'm a list."),
              ),
            ],
          ),
          // 类似侧边栏的功能
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1, microseconds: 500),
              width: 200,
              height: double.infinity,
              // 刚开始的时候隐藏在左侧
              transform: flag
                  ? Matrix4.translationValues(-200, 0, 0)
                  : Matrix4.translationValues(0, 0, 0),
              color: Colors.red,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

// AnimatedPadding
class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: AnimatedPadding(
        curve: Curves.bounceIn, // 默认是线性的
        // 改变padding值的时候，执行动画
        padding: EdgeInsets.fromLTRB(10, flag ? 10 : 200, 0, 0),
        // 同样必传duration
        duration: const Duration(seconds: 1, milliseconds: 500),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.amber,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

// animated opacity 组件的透明度变化
class MyHomePage4 extends StatefulWidget {
  const MyHomePage4({super.key});

  @override
  State<MyHomePage4> createState() => _MyHomePage4State();
}

class _MyHomePage4State extends State<MyHomePage4> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: Center(
        child: AnimatedOpacity(
          // 该属性必传，1为完全不透明，0为透明
          opacity: flag ? 0.1 : 1,
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

// animated positioned
class MyHomePage5 extends StatefulWidget {
  const MyHomePage5({super.key});

  @override
  State<MyHomePage5> createState() => _MyHomePage5State();
}

class _MyHomePage5State extends State<MyHomePage5> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: Stack(children: [
        ListView(
          children: const [
            ListTile(
              title: Text("I'm a list."),
            ),
            ListTile(
              title: Text("I'm a list."),
            ),
            ListTile(
              title: Text("I'm a list."),
            ),
            ListTile(
              title: Text("I'm a list."),
            ),
          ],
        ),
        AnimatedPositioned(
          curve: Curves.decelerate,
          top: flag ? 10 : 560,
          right: flag ? 10 : 290,
          duration: const Duration(seconds: 2),
          child: Container(
            width: 60,
            height: 60,
            color: Colors.amber,
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

// AnimatedDefaultTextStyle
class MyHomePage6 extends StatefulWidget {
  const MyHomePage6({super.key});

  @override
  State<MyHomePage6> createState() => _MyHomePage6State();
}

class _MyHomePage6State extends State<MyHomePage6> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          color: Colors.blue,
          child: AnimatedDefaultTextStyle(
            // style改变的时候执行动画
            style: TextStyle(
                fontSize: flag ? 20 : 40,
                color: flag ? Colors.white : Colors.amber),
            duration: const Duration(seconds: 2),
            child: const Text("Hello Flutter"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

// AnimatedSwitcher
// 与上面不同之处在于，这是在子元素改变（而非属性）的时候执行动画
class MyHomePage7 extends StatefulWidget {
  const MyHomePage7({super.key});

  @override
  State<MyHomePage7> createState() => _MyHomePage7State();
}

class _MyHomePage7State extends State<MyHomePage7> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          color: Colors.yellow,
          // 在外层包一个AnimatedSwitcher，它的child内容改变时，会有动画效果
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            // 改变动画效果，默认淡入淡出效果
            transitionBuilder: (child, animation) {
              // 返回一个显式动画，用animation来加载child
              return ScaleTransition(
                scale: animation,
                // 通过child里放Transition，实现多个动画叠加
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: flag
                ? const CircularProgressIndicator() // 加载动画
                : Image.asset(
                    "images/pic1.png",
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

// AnimatedSwitcher子组件内容改变、类型不改变时，如何实现动画效果
class MyHomePage8 extends StatefulWidget {
  const MyHomePage8({super.key});

  @override
  State<MyHomePage8> createState() => _MyHomePage8State();
}

class _MyHomePage8State extends State<MyHomePage8> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          color: Colors.yellow,
          // 在外层包一个AnimatedSwitcher，它的child内容改变时，会有动画效果
          child: AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              // 改变动画效果，默认淡入淡出效果
              transitionBuilder: (child, animation) {
                // 返回一个显式动画，用animation来加载child
                return ScaleTransition(
                  scale: animation,
                  // 通过child里放Transition，实现多个动画叠加
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Text(
                key: UniqueKey(), // 配置key，这样文字内容改变时，会生成新的Text
                flag ? "Hello world" : "Flutter APP",
                style: const TextStyle(fontSize: 30),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
