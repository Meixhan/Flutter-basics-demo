// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'routers/routers.dart';

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
      home: const MyHomePage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}

//
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List listData = [
    {
      "id": 0,
      "title": "原批万岁",
      "description": "哒哒哒~",
      "imageUrl": 'images/pic1.png'
    },
    {
      "id": 1,
      "title": "原批万岁",
      "description": "略略略~",
      "imageUrl": 'images/OIP.jpg'
    },
  ];

  List<Widget> _getListData() {
    var tempList = listData.map((e) {
      // 外面包一个手势事件，或者Inkwell也行
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/hero", arguments: {
            "imageUrl": e["imageUrl"],
            "listData": listData,
            "initialPage": e["id"],
          });
        },
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(233, 233, 233, 0.9),
              width: 1,
            ),
          ),
          child: Column(children: <Widget>[
            Hero(tag: e['imageUrl'], child: Image.asset(e['imageUrl'])),
            const SizedBox(
              height: 10,
            ),
            Text(
              e['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ]),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animation"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: const EdgeInsets.all(10),
        childAspectRatio: 0.9,
        children: _getListData(),
      ),
    );
  }
}
