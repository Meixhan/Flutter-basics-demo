import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage3(),
    );
  }
}

// 企图用stateless widget实现动态组件的功能
class MyHomePage extends StatelessWidget {
  int countNum = 0;
  // 构造函数不能用const
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$countNum",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  countNum++;
                  // countNum的值会增加，但是组件不会重新build
                  // ignore: avoid_print
                  print(countNum);
                },
                child: const Text("+"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 定义一个stateful widget
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  // 必须重写这个抽象方法
  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  int _numCount = 0;
  @override
  Widget build(BuildContext context) {
    // 推荐把Scaffold放在子组件内
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "功德：$_numCount", // int类型转String
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 75,
              width: 75,
              child: ElevatedButton(
                onPressed: () {
                  // 执行方法后会重新build
                  setState(() {
                    _numCount++;
                  });
                },
                child: const Text("+"),
              ),
            ),
          ],
        ),
      ),
      // Scaffold内带的底部浮动按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _numCount++;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}

// 实现一个动态列表
class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  // 必须重写这个抽象方法
  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  // 定义数组，虽然数组是final类型，但是依然可以往里面增加值
  // 如果是const修饰的话，定义的时候就要给他赋值，然后不可增加
  final List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter App")),
      body: ListView(
        children: _list
            .map((e) => ListTile(
                  title: Text(e),
                ))
            .toList(),
      ),
      // Scaffold内带的底部浮动按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _list.add("Hi, I'm a list.");
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
