// ignore_for_file: avoid_print

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
      home: const MyHomePage3(),
    );
  }
}

// AnimatedIcon
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // 类似的，需要一个AnimationController
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // AnimatedIcons提供了不少默认的过渡效果
            AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _controller,
              size: 40,
            ),
            AnimatedIcon(
              icon: AnimatedIcons.home_menu,
              progress: _controller,
              size: 40,
            ),
            AnimatedIcon(
              icon: AnimatedIcons.search_ellipsis,
              progress: _controller,
              size: 40,
            ),
            AnimatedIcon(
              icon: AnimatedIcons.pause_play,
              progress: _controller,
              size: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _controller.forward();
          _controller.repeat(reverse: true);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// 自定义交错式动画
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2>
    with SingleTickerProviderStateMixin {
  // 类似的，需要一个AnimationController
  late AnimationController _controller;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation"),
      ),
      body: Center(
        child: Stack(
          children: [
            // 第一秒search消失，第二秒close出现
            ScaleTransition(
              // Tween里面从1到0，表示从有到无
              // CurveTween里面的Interval从0到0.5，表示前50%的时间（1秒）
              scale: _controller.drive(Tween(begin: 1.0, end: 0.0)
                  .chain(CurveTween(curve: const Interval(0, 0.5)))),
              child: const Icon(Icons.search, size: 40),
            ),
            ScaleTransition(
              scale: _controller.drive(Tween(begin: 0.0, end: 1.0)
                  .chain(CurveTween(curve: const Interval(0.5, 1)))),
              child: const Icon(Icons.close, size: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flag ? _controller.forward() : _controller.reverse();
          flag = !flag;
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// SlideTransition的交错式动画
class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3>
    with SingleTickerProviderStateMixin {
  // 类似的，需要一个AnimationController
  late AnimationController _controller;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 在需要运动的元素外围包上显式动画
            SlidingBox(
              controller: _controller,
              color: Colors.blue.shade100,
              curve: const Interval(0.0, 0.4),
            ),
            SlidingBox(
              controller: _controller,
              color: Colors.blue.shade200,
              curve: const Interval(0.2, 0.6),
            ),
            SlidingBox(
              controller: _controller,
              color: Colors.blue.shade300,
              curve: const Interval(0.4, 0.8),
            ),
            SlidingBox(
              controller: _controller,
              color: Colors.blue.shade400,
              curve: const Interval(0.6, 1.0),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flag ? _controller.forward() : _controller.reverse();
          flag = !flag;
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// 进行一个封装
class SlidingBox extends StatelessWidget {
  final AnimationController controller;
  Color color;
  Curve curve;
  SlidingBox(
      {super.key,
      required this.controller,
      required this.color,
      required this.curve});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.drive(Tween(
        begin: const Offset(0, 0),
        end: const Offset(1, 0),
      ).chain(CurveTween(curve: curve))),
      child: Container(
        height: 50,
        width: 120,
        color: color,
      ),
    );
  }
}
