// 基础组件 importM: import material package
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(title: const Text("Hello Flutter")),
        body: const Column(children: [
          MyApp(),
          SizedBox(
            height: 10,
          ), // 用于提供间距
          CirclePic(),
          SizedBox(
            height: 10,
          ),
          ClipPic(),
          SizedBox(
            height: 10,
          ),
          LocalPic()
        ])),
  ));
}

// picture
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 图片一般放在容器中，方便配置显示
    return Center(
      child: Container(
        height: 200,
        width: 200,
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
        decoration: const BoxDecoration(color: Colors.grey),
        // 图片放在child中
        child: Image.network(
          "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
          // alignment: Alignment.topCenter, // 也可以通过外部的alignment控制
          // scale: 2, // scale = 2表示缩小一倍
          // fit: BoxFit.fill, // fill表示充满整个容器
          // fit: BoxFit.cover, // 裁剪后充满容器，不变形
          repeat: ImageRepeat.repeatY, // 平铺
        ),
      ),
    );
  }
}

// 圆形图片
class CirclePic extends StatelessWidget {
  const CirclePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(75), // 半径是长宽的一半
        image: const DecorationImage(
            image: NetworkImage(
                "https://umd.edu/sites/umd.edu/files/Do_Good_0_0_0.png"),
            fit: BoxFit.cover),
      ),
    );
  }
}

// 使用ClipOval实现圆形图片
class ClipPic extends StatelessWidget {
  const ClipPic({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        "https://umd.edu/sites/umd.edu/files/Do_Good_0_0_0.png",
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

// 加载本地图片
class LocalPic extends StatelessWidget {
  const LocalPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(color: Colors.yellow),
      child: Image.asset("images/pic1.png"),
    );
  }
}
