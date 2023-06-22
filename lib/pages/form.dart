// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// 当前页面接收上个页面传过来的参数
class FormPage extends StatefulWidget {
  final String title;
  int count;
  FormPage({super.key, this.title = "表单", required this.count});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  void initState() {
    super.initState();
    print(widget.count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 通过Widget. 来直接用组件里的属性值
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("I'm a form page. ${widget.count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.count++;
            print(widget.count);
            // 返回上一页
            // 类似栈结构，需要栈内有别的页面
            Navigator.pop(context);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
