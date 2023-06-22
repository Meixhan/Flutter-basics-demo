import 'package:flutter/material.dart';
import 'package:flutter01/pages/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //去掉右上角的DEBUG
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const MyHomePage(),
      home: const MyNavigationBar(),
    );
  }
}

// 定义一个stateful widget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 混入SingleTickerProviderStateMixin
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 生命周期函数：当组件初始化的时候触发
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this); // 只需要改一下长度
  }

  @override
  Widget build(BuildContext context) {
    // 推荐把Scaffold放在子组件内
    return Scaffold(
      appBar: AppBar(
        // 左侧的按钮图标
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        // AppBar的背景颜色
        backgroundColor: Colors.red,
        // 配置导航名称
        title: const Text("Flutter App"),
        centerTitle: true, // 居中显示
        // 右侧的按钮图标，可以配置多个
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
        // 顶部滑动的导航栏
        bottom: TabBar(
          // 需要配置controller，否则整个页面报错
          controller: _tabController, // 它不是const
          // 配置是否可以滚动，用于选项卡比较多的时候
          isScrollable: false,
          // 指示器（下面的线）的颜色
          indicatorColor: Colors.white,
          // 指示器高度
          indicatorWeight: 3,
          indicatorPadding: const EdgeInsets.all(3),
          // 指示器配置成和文字等长，默认TabBarIndicatorSize.tab
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10), // 和其他地方类似，配置圆角
          ),
          // label的颜色，配合unselectedLabelColor使用
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w800, // 选中时加粗
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
          tabs: const [
            // 每一个选项卡
            Tab(
              child: Text("关注"),
            ),
            Tab(
              child: Text("热门"),
            ),
            Tab(
              child: Text("本地"),
            ),
          ],
        ),
      ),
      // 在body中配置TabBarView，点击某个Tab的时候，显示对应页面
      // children里的顺序和tabs里的一一对应
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: const [
              ListTile(
                title: Text("我的关注列表"),
              ),
              ListTile(
                title: Text("我的关注列表"),
              ),
              ListTile(
                title: Text("我的关注列表"),
              ),
            ],
          ),
          ListView(
            children: const [
              ListTile(
                title: Text("热门列表"),
              )
            ],
          ),
          // 可以是任意组件
          Image.asset("images/pic1.png"),
        ],
      ),
    );
  }
}
