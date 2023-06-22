// ignore_for_file: avoid_print
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter01/pages/tools/keepAliveWrapper.dart';

import 'package:flutter01/widgets/imagePage.dart';
import 'package:flutter01/widgets/swiper.dart';

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
      home: const MyHomePage6(),
    );
  }
}

// PageView基础版
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PageView"),
        ),
        body: PageView(
          // 滑动方向，默认水平方向滑动
          scrollDirection: Axis.vertical,
          children: [
            // children里的每一个child就是一个页面
            Center(
              child: Text(
                "第一页",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Center(
              child: Text(
                "第二页",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Center(
              child: Text(
                "第三页",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Center(
              child: Text(
                "第四页",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ));
  }
}

// 使用.builder构建PageView
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    // 利用builder创建PageView
    return Scaffold(
      appBar: AppBar(title: const Text("PageView")),
      body: PageView.builder(
          itemCount: 10, // 一共10页
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                "第${index + 1}页",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }),
    );
  }
}

// 无限加载
class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  List<Widget> list = [];

  // 初始化页面列表
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 10; i++) {
      list.add(
        Center(
          child: Text(
            "第${i + 1}页",
            // 拿不到context
            // style: Theme.of(context).textTheme.headlineMedium,
            style: const TextStyle(fontSize: 50),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageView")),
      body: PageView(
        scrollDirection: Axis.vertical,
        // 监听页面改变的事件
        onPageChanged: (index) {
          print(index); // index就是页面索引
          // 无限加载
          if (index == list.length - 2) {
            setState(() {
              int prevLength = list.length;
              for (var i = 0; i < 10; i++) {
                list.add(Center(
                  child: Text(
                    "第${prevLength + i + 1}页",
                    style: const TextStyle(fontSize: 50),
                  ),
                ));
              }
            });
          }
        },
        children: list,
      ),
    );
  }
}

// 轮播图
class MyHomePage4 extends StatefulWidget {
  const MyHomePage4({super.key});

  @override
  State<MyHomePage4> createState() => _MyHomePage4State();
}

class _MyHomePage4State extends State<MyHomePage4> {
  List<Widget> list = [];
  // 当前显示的轮播图索引
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    list = const [
      ImagePage(
        src: "images/pic1.png",
      ),
      ImagePage(
        src: "images/OIP.jpg",
      ),
      ImagePage(
        src: "images/pic1.png",
      ),
      ImagePage(
        src: "images/OIP.jpg",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("PageView")),
        body: Stack(
          // alignment: Alignment.center,
          children: [
            SizedBox(
              height: 300,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    // 实时更新轮播图索引
                    _curIndex = index % list.length;
                  });
                },
                itemCount: 1000, //  设置成一个很大的数字
                itemBuilder: (context, index) {
                  return list[index % list.length];
                },
              ),
            ),
            Positioned(
                left: 0,
                right: 0, // 同时设置left和right为0，就会居中
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(list.length, (index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        // 利用三元运算设置颜色
                        color: _curIndex == index ? Colors.blue : Colors.grey,
                        shape: BoxShape.circle, // 两种方式实现圆
                        // borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                ))
          ],
        ));
  }
}

// 带定时器的轮播图
class MyHomePage5 extends StatefulWidget {
  const MyHomePage5({super.key});

  @override
  State<MyHomePage5> createState() => _MyHomePage5State();
}

class _MyHomePage5State extends State<MyHomePage5> {
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    list = const [
      "images/pic1.png",
      "images/OIP.jpg",
      "images/pic1.png",
      "images/OIP.jpg"
    ];

    // 创建定时器
    // 第一个参数Duration，指定几秒几分钟
    // 第二个参数是回调函数，每隔指定时间执行一次
    Timer.periodic(const Duration(seconds: 3), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("PageView")),
        body: ListView(
          children: [
            Swiper(list: list), // 将轮播图进行抽离
          ],
        ));
  }
}

// 带缓存的PageView
class MyHomePage6 extends StatefulWidget {
  const MyHomePage6({super.key});

  @override
  State<MyHomePage6> createState() => _MyHomePage6State();
}

class _MyHomePage6State extends State<MyHomePage6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView"),
      ),
      body: PageView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            // return MyContainer(num: index);  // 方式一
            return KeepAliveWrapper(
                child: MyContainer2(
              num: index,
            )); // 方式二
          }),
    );
  }
}
