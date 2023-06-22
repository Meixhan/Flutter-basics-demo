// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

import 'imagePage.dart';

class Swiper extends StatefulWidget {
  // 容器宽度和高度
  final double height;
  final double width;
  final List<String> list;
  const Swiper(
      {super.key,
      this.height = 250,
      this.width = double.infinity,
      required this.list});

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  // 当前显示的轮播图索引
  int _curIndex = 0;
  List<Widget> pageList = [];
  late PageController _pageController;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < widget.list.length; i++) {
      pageList.add(ImagePage(
        src: widget.list[i],
      ));
    }

    // 定义初始化页面
    _pageController = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 5), (t) {
      // 跳转页面
      _pageController.animateToPage(
        (_curIndex + 1) % pageList.length, // 跳转页面索引
        duration: const Duration(microseconds: 600), // 跳转时长
        curve: Curves.easeInOut, // 跳转动画：线性跳转
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.center,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            // 在这里绑定pageController
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                // 实时更新轮播图索引
                _curIndex = index % pageList.length;
              });
            },
            itemCount: 1000, //  设置成一个很大的数字
            itemBuilder: (context, index) {
              return pageList[index % pageList.length];
            },
          ),
        ),
        Positioned(
            left: 0,
            right: 0, // 同时设置left和right为0，就会居中
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageList.length, (index) {
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 销毁组件的时候，把Timer和PageController销毁
    timer.cancel();
    _pageController.dispose();
  }
}

// 自定义组件，带缓存
class MyContainer extends StatefulWidget {
  final int num;
  const MyContainer({super.key, required this.num});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // 如果没有缓存，每次切换页面都会重新执行build
    print(widget.num);
    return Center(
      child: Text(
        "第${widget.num}页",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; // 返回true，表示执行自动缓存
}

// 也可以使用KeepAliveWrapper
class MyContainer2 extends StatefulWidget {
  final int num;
  const MyContainer2({super.key, required this.num});

  @override
  State<MyContainer2> createState() => _MyContainer2State();
}

class _MyContainer2State extends State<MyContainer2> {
  @override
  Widget build(BuildContext context) {
    // 如果没有缓存，每次切换页面都会重新执行build
    print(widget.num);
    return Center(
      child: Text(
        "第${widget.num}页",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
