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
      home: const MyHomePage2(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 组件更新时，其状态的保存主要通过判断组件类型或Key是否一致
  // 组件类型不一样时，无法保存状态；组件类型完全一致时，又无法更新
  // 指定ValueKey，不能重复
  List<Widget> list = [
    const Box(key: ValueKey(1), color: Colors.red),
    const Box(key: ValueKey(2), color: Colors.blue),
    const Box(key: ValueKey(3), color: Colors.yellow)
  ];

  // UniqueKey随机生成，唯一值，不要加const
  // ObjectKey里面放一个Object
  // 无论用哪种类型的Key都行
  List<Widget> list2 = [
    Box(key: UniqueKey(), color: Colors.red),
    Box(key: UniqueKey(), color: Colors.blue),
    // ObjectKey内部会new一个新的对象，不会报错
    const Box(key: ObjectKey(Box(color: Colors.yellow)), color: Colors.yellow),
    const Box(key: ObjectKey(Box(color: Colors.yellow)), color: Colors.yellow)
  ];

  // 定义GlobalKey
  final GlobalKey _globalKey1 = GlobalKey();
  final GlobalKey _globalKey2 = GlobalKey();
  final GlobalKey _globalKey3 = GlobalKey();

  List<Widget> list3 = [];

  // 定义好的global key不能直接赋值给box，需要在initState里操作
  @override
  void initState() {
    super.initState();
    list3 = [
      Box(key: _globalKey1, color: Colors.red),
      Box(key: _globalKey2, color: Colors.blue),
      Box(key: _globalKey3, color: Colors.yellow),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕方向（横屏/竖屏）
    // portrait竖屏，landscape横屏
    print(MediaQuery.of(context).orientation);

    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView"),
      ),
      body: Center(
        // 如果是竖屏，里面放一个Column，竖向排列box
        // 否则横向排列box
        // 由于两组box摆放在不同组件中，所以不会保存状态，需要使用GlobalKey
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list3,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list3,
              ),
      ),
      // 按下按钮，打乱box的顺序
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // 打乱list时，里面元素的类型没有改变
            // 如果此时不设置key，flutter会认为组件不需要更新
            list3.shuffle();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// 父widget
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: Center(child: Box(key: _globalKey, color: Colors.red)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // .currentState => _BoxState
          // .currentWidget => Box

          // 获取currentState Widget的属性
          var boxState = _globalKey.currentState as _BoxState;
          // 获取子widget的属性
          print(boxState._count);
          // 通过setState改变子widget的属性
          setState(() {
            boxState._count++;
          });
          // 调用子widget的方法，甚至可以调私有方法
          boxState._run();

          // 获取子widget
          var boxWidget = _globalKey.currentWidget as Box;
          print(boxWidget.color);

          // 获取子widget渲染的属性
          var renderBox =
              _globalKey.currentContext!.findRenderObject() as RenderBox;
          print(renderBox.size);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color color;
  const Box({super.key, required this.color});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  void _run() {
    print("run function in Box");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: ElevatedButton(
          // 根据构造函数，拿到传到的color值配置给按钮
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widget.color)),
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          child: Text(
            "$_count",
            style: Theme.of(context).textTheme.headlineMedium,
          )),
    );
  }
}
