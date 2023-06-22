import 'package:flutter/material.dart';

// 自定义Dialog，需要继承Dialog，它是一个stateless widget
class MyDialog extends Dialog {
  // 定义属性，用于从外部传值
  final String title;
  final String content;

  final Function()? onTap;

  const MyDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.onTap});

  // 需要重写build方法
  @override
  Widget build(BuildContext context) {
    return Material(
      // 外侧透明
      type: MaterialType.transparency,
      // 在外层套一个Center组件，里面的Container的长和高才生效
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  // 必须用Stack实现定位效果
                  children: [
                    // 左侧提示信息
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    // 右侧关闭按钮
                    Align(
                      alignment: Alignment.centerRight,
                      child:
                          // InkWell可以为里面的元素附加点击事件
                          // 也可使用IconButton，只是排版有些问题
                          InkWell(onTap: onTap, child: const Icon(Icons.close)),
                    )
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: double.infinity, //  和外部等宽
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
