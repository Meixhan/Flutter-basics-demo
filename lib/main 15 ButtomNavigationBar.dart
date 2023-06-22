import 'package:flutter/material.dart';
import 'pages/tabs.dart';

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
      // 在statelessWidget里面调用statefulWidget
      // 将整个导航栏进行分离
      home: const MyNavigationBar(),
    );
  }
}

// flutter run -d chrome --web-port=8080 --web-hostname=192.168.253.1

