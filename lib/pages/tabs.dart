import 'package:flutter/material.dart';
// 引入其它界面
import 'tabs/home.dart';
import 'tabs/category.dart';
import 'tabs/message.dart';
import 'tabs/settings.dart';
import 'tabs/user.dart';

class MyNavigationBar extends StatefulWidget {
  final int index; // 当前的选项卡，默认为0（首页）
  const MyNavigationBar({super.key, this.index = 0});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  // 当前选中的按钮
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    SettingsPage(),
    UserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
          elevation: 1,
          backgroundColor: Colors.red,
        ),
        // 配置左侧侧边栏
        drawer: const Drawer(
          child: Column(
            children: [
              // 避免顶在最上方
              // SizedBox(height: 40),
              Row(
                children: [
                  // 自定义的Drawer Header
                  //CustomDrawerHeader(),
                  Expanded(
                    flex: 1,
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          // color: Colors.yellowAccent,
                          image: DecorationImage(
                              image: AssetImage(
                                "images/pic1.png",
                              ),
                              fit: BoxFit.cover)),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("images/OIP.jpg"),
                      ),
                      accountName: Text("小派蒙"), // 用户名
                      accountEmail: Text("123@paimon.com"), // 用户邮箱
                    ),
                  )
                ],
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("个人中心"),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.settings),
                ),
                title: Text("设置"),
              ),
              Divider(),
            ],
          ),
        ),
        // 配置右侧侧边栏
        endDrawer: const Drawer(
          child: Text("右侧侧边栏"),
        ),
        body: _pages[_currentIndex],
        // 底部导航栏
        bottomNavigationBar: BottomNavigationBar(
          // 配置图标大小
          iconSize: 30,
          // 选中的颜色
          fixedColor: Colors.red,
          // 如果放四个以上菜单时，配置该参数，默认shifting
          type: BottomNavigationBarType.fixed,
          // 默认选中哪一个，0为第一个
          currentIndex: _currentIndex,
          // onTap监听菜单的点击
          onTap: (index) {
            // 内部调用setState
            setState(() {
              _currentIndex = index;
            });
          },
          // items为必填项
          items: const [
            BottomNavigationBarItem(
              // icon为必填项
              icon: Icon(Icons.home),
              // label为图标下面的文字
              label: "首页",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "分类",
            ),
            BottomNavigationBarItem(
              icon: Icon(null), // 该图标不显示
              label: "消息",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "设置",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "用户",
            ),
          ],
        ),
        // floating action button 的位置，默认endFloat
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // 在外层包一个Container，方便微调位置和按钮大小
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 11),
          padding: const EdgeInsets.all(10),
          height: 68,
          width: 68,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(35))),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            // 背景颜色，三目表达式
            backgroundColor: _currentIndex == 2 ? Colors.red : Colors.blue,
            child: const Icon(Icons.add),
          ),
        ));
  }
}

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, // 横向充满
      child: DrawerHeader(
          decoration: const BoxDecoration(
              // color: Colors.yellowAccent,
              image: DecorationImage(
                  image: AssetImage(
                    "images/pic1.png",
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              ListTile(
                leading: ClipOval(
                  child: Image.asset(
                    "images/OIP.jpg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text("小派蒙"),
              )
            ],
          )),
    );
  }
}
