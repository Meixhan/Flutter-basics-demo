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
      home: const MyHomePage4(),
    );
  }
}

// RotationTransition
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// with SingleTickerProviderStateMixin 用于vsync
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // vsync用于让程序的刷新频率和手机的刷新频率统一
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // 可以直接通过..repeat让它在创建后就开始旋转
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            RotationTransition(
              // 必填turns配置旋转动画，Animation<double>类型
              turns: _controller,
              child: const FlutterLogo(
                size: 90,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.forward(); // 运动一次
                    },
                    child: const Icon(Icons.arrow_forward)),
                ElevatedButton(
                    onPressed: () {
                      _controller.stop(); // 停止运动
                    },
                    child: const Icon(Icons.pause)),
                ElevatedButton(
                    onPressed: () {
                      _controller.reset(); // 重置
                    },
                    child: const Icon(Icons.refresh)),
                ElevatedButton(
                    onPressed: () {
                      _controller.repeat(); // 重复运动
                    },
                    child: const Icon(Icons.repeat)),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse(); // 反转运动
                    },
                    child: const Icon(Icons.flip_camera_android)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// FadeTransition
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // vsync用于让程序的刷新频率和手机的刷新频率统一
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // 从0.5到1
      lowerBound: 0.5,
      upperBound: 1,
    )..forward();

    // 值变化的时候执行操作
    _controller.addListener(() {
      // 值从0到1（从完全透明到完全不透明）
      // print(_controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            FadeTransition(
              // 必填opacity配置淡入淡出动画，Animation<double>类型
              opacity: _controller,
              child: const FlutterLogo(
                size: 120,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.forward(); // 运动一次
                    },
                    child: const Icon(Icons.arrow_forward)),
                ElevatedButton(
                    onPressed: () {
                      _controller.stop(); // 停止运动
                    },
                    child: const Icon(Icons.pause)),
                ElevatedButton(
                    onPressed: () {
                      _controller.reset(); // 重置
                    },
                    child: const Icon(Icons.refresh)),
                ElevatedButton(
                    onPressed: () {
                      _controller.repeat(); // 重复运动
                    },
                    child: const Icon(Icons.repeat)),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse(); // 反转运动
                    },
                    child: const Icon(Icons.flip_camera_android)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ScaleTransition
class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
      // size为200的情况下，0.5~1.5表示尺寸100~300
      // lowerBound: 0.5,
      // upperBound: 1.5,
    )..repeat(reverse: true);
    // reverse默认false，设置为true后会在0~1之间（默认）来回波动
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ScaleTransition(
              // 必传scale配置尺寸
              scale: _controller.drive(
                // Tween配置运动的参数
                // size=200时，尺寸在100~300波动，类似于lower/upperBound
                Tween(begin: 0.5, end: 1.5),
              ),
              child: const FlutterLogo(
                size: 200,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.forward(); // 运动一次
                    },
                    child: const Icon(Icons.arrow_forward)),
                ElevatedButton(
                    onPressed: () {
                      _controller.stop(); // 停止运动
                    },
                    child: const Icon(Icons.pause)),
                ElevatedButton(
                    onPressed: () {
                      _controller.reset(); // 重置
                    },
                    child: const Icon(Icons.refresh)),
                ElevatedButton(
                    onPressed: () {
                      _controller.repeat(reverse: true); // 重复运动
                    },
                    child: const Icon(Icons.repeat)),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse(); // 反转运动
                    },
                    child: const Icon(Icons.flip_camera_android)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// SlideTransition
class MyHomePage4 extends StatefulWidget {
  const MyHomePage4({super.key});

  @override
  State<MyHomePage4> createState() => _MyHomePage4State();
}

class _MyHomePage4State extends State<MyHomePage4>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // lowerBound: 0.5,
      // upperBound: 1.5,
    )..repeat(reverse: true);
    // reverse默认false，设置为true后会在0~1之间（默认）来回波动
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SlideTransition(
              // 必传position配置位置，注意，它不是Animation<Double>
              // position: _controller.drive(Tween(
              //   // 在Tween里配置begin和end，均为Offset类型
              //   // 括号里的值需要乘上size大小（200）才是实际位移距离！
              //   begin: const Offset(0, 0),
              //   end: const Offset(-0.1, 0.5), // 向左移动20，向下移动100
              // ).chain(
              //   // 配置运动效果
              //   CurveTween(curve: Curves.easeInCubic),
              // )),
              // 另一种实现方式
              position: Tween(
                begin: const Offset(0, 0),
                end: const Offset(-0.1, 0.5),
              )
                  .chain(CurveTween(
                    // 当前时间点20%~80%运动，共2s时间，在0.4s~1.6s运动
                    curve: const Interval(0.2, 0.8),
                  ))
                  .animate(_controller),
              child: const FlutterLogo(
                size: 200,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.forward(); // 运动一次
                    },
                    child: const Icon(Icons.arrow_forward)),
                ElevatedButton(
                    onPressed: () {
                      _controller.stop(); // 停止运动
                    },
                    child: const Icon(Icons.pause)),
                ElevatedButton(
                    onPressed: () {
                      _controller.reset(); // 重置
                    },
                    child: const Icon(Icons.refresh)),
                ElevatedButton(
                    onPressed: () {
                      _controller.repeat(reverse: true); // 重复运动
                    },
                    child: const Icon(Icons.repeat)),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse(); // 反转运动
                    },
                    child: const Icon(Icons.flip_camera_android)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
