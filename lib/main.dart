import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // 响应式状态变量，通过0.obs设置
  final RxInt _counter = 0.obs;
  // final RxInt _counter1 = RxInt(0);
  // String类型的变量
  final RxString _userName = "Alice".obs;
  final RxList<String> _list = ["A", "B", "C"].obs;
  // 另一种定义方法
  final Rx<String> _sex = Rx<String>("Male");

  // 实例化类
  var p = Person();
  // 对于普通的类，必须加.obs
  var a = Animal(age: 3, type: "Cat").obs;

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 渲染时，使用Obx方法包裹，否则不会实现局部刷新
            Obx(
              () => Text(
                "${_counter.value}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return Text(
                _userName.value,
                style: Theme.of(context).textTheme.headlineLarge,
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _list.map((element) => Text(element)).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(
                _sex.value,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(
                "${p.userName}: ${p.age}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(
                "${a.value.type}: ${a.value.age}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 通过.value获取值
          _counter.value++;
          _userName.value = "Bob";
          _list.add("X");
          p.userName.value = "Elk";
          p.age.value = 40;

          // 先将a.value里面的值更新，然后更新a.value
          a.value.type = "Dog";
          a.value.age = 4;
          a.value = a.value;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Person类
class Person {
  RxString userName = "Alice".obs;
  RxInt age = 20.obs;
}

// 普通类Animal
class Animal {
  String type;
  int age;
  Animal({required this.age, required this.type});
}
