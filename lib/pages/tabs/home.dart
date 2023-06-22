import 'package:flutter/material.dart';
import '/pages/tools/keepAliveWrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 生命周期函数：当组件初始化的时候触发
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    // 监听 _tabController的改变事件（点击事件+滑动事件）
    _tabController.addListener(() {
      // 获取菜单的索引值
      // animation可空，需要添加类型断言
      if (_tabController.animation!.value == _tabController.index) {
        // ignore: avoid_print
        print(_tabController.index);
      }
    });
  }

  // 生命周期函数：销毁的时候触发
  @override
  void dispose() {
    super.dispose();
    // 退出Home组件的时候会销毁
    // 销毁tabController
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 在Scaffold内部可以继续放Scaffold
    return Scaffold(
      // appBar传入的是PreferredSizeWidget，可以在里面放入AppBar
      appBar: PreferredSize(
        // 通过preferred size指定高度
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
            backgroundColor: Colors.white,
            // 阴影效果，不要
            elevation: 0.5,
            // 内部的Scaffold的标题是不需要的，title接受任意Widget
            // 所以可以把原本bottom里的TabBar放入title里
            title: SizedBox(
              height: 30, // 通过SizedBox改TabBar的高度
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: const [
                  Tab(
                    child: Text("关注"),
                  ),
                  Tab(
                    child: Text("热门"),
                  )
                ],
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
              ),
            )),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          KeepAliveWrapper(
            // 当内容比较多的时候，下滑到底部后，切换界面回来，位置会重置
            // 需要通过缓存留住上次访问的位置
            child: ListView(
              children: const [
                ListTile(
                  title: Text("This is following list #1."),
                ),
                ListTile(
                  title: Text("This is following list #2."),
                ),
                ListTile(
                  title: Text("This is following list #3."),
                ),
                ListTile(
                  title: Text("This is following list #4."),
                ),
                ListTile(
                  title: Text("This is following list #5."),
                ),
                ListTile(
                  title: Text("This is following list #6."),
                ),
                ListTile(
                  title: Text("This is following list #7."),
                ),
                ListTile(
                  title: Text("This is following list #8."),
                ),
                ListTile(
                  title: Text("This is following list #9."),
                ),
                ListTile(
                  title: Text("This is following list #10."),
                ),
                ListTile(
                  title: Text("This is following list #11."),
                ),
                ListTile(
                  title: Text("This is following list #12."),
                ),
                ListTile(
                  title: Text("This is following list #13."),
                )
              ],
            ),
          ),
          const Center(
            child: Text(
              "今日热门",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
