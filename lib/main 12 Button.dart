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
        body: const MyHomePage(),
      ),
    );
  }
}

// Buttons
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 抬起的按钮
            ElevatedButton(
              onPressed: () {
                // 如果不加onPressed，按钮就是灰色的
                print("Elevated button pressed.");
              }, // 函数
              child: const Text("普通按钮"),
            ),
            // 文本按钮，只有文本，无按钮边框
            TextButton(
              onPressed: () {},
              child: const Text("文本按钮"),
            ),
            // 带边框的按钮，无填充颜色
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                  //配置边框颜色，默认灰色
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.yellow, width: 3))),
              child: const Text("带边框按钮"),
            ),
            // 图标按钮
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // 带图标的按钮，结合Elevated/Text/OutlineButton
        // 通过一个icon的构造函数
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                  // 背景颜色不是Colors类型
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  // 文字&t图标颜色通过foreground color
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app),
              label: const Text("退出"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: const Text("搜索"),
            ),
            OutlinedButton.icon(
              // 自定义样式
              style: ButtonStyle(
                  // iconColor: MaterialStateProperty.all(Colors.grey),
                  foregroundColor: MaterialStateProperty.all(Colors.grey)),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("添加"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 在按钮外面包一个SizedBox，配置它的高度宽度，这样按钮就能充满面积
            SizedBox(
              height: 100,
              width: 200,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text("发送"),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            // 按钮充满整个屏幕宽度
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 40,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text("登录"),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 圆角按钮
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.circle_outlined),
                style: ButtonStyle(
                    // 与Card里配置圆角类似
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                label: const Text("圆角"),
              ),
            ),
            // 圆形按钮
            SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(shape: MaterialStateProperty.all(
                    // 也是在这里面配置
                    const CircleBorder(side: BorderSide(color: Colors.white)))),
                child: const Text("~"),
              ),
            )
          ],
        ),
      ],
    );
  }
}
