import 'package:flutter/material.dart';

// 图片预览等
import 'package:photo_view/photo_view.dart';
// 多张图片
import 'package:photo_view/photo_view_gallery.dart';

class HeroPage extends StatefulWidget {
  // 跳转路由的时候，传arguments
  final Map arguments;
  const HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: widget.arguments["imageUrl"],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(widget.arguments["imageUrl"]),
            ),
          ),
        ),
      ),
    );
  }
}

// PhotoView实现单张图片预览
class HeroPage2 extends StatefulWidget {
  // 跳转路由的时候，传arguments
  final Map arguments;
  const HeroPage2({super.key, required this.arguments});

  @override
  State<HeroPage2> createState() => _HeroPage2State();
}

class _HeroPage2State extends State<HeroPage2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: widget.arguments["imageUrl"],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: PhotoView(
                    imageProvider: AssetImage(widget.arguments["imageUrl"]))),
          ),
        ),
      ),
    );
  }
}

// PhotoView实现多张图片预览
class HeroPage3 extends StatefulWidget {
  // 跳转路由的时候，传arguments
  final Map arguments;
  const HeroPage3({super.key, required this.arguments});

  @override
  State<HeroPage3> createState() => _HeroPage3State();
}

class _HeroPage3State extends State<HeroPage3> {
  late List listData = [];
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
    listData = widget.arguments["listData"];
    initialPage = widget.arguments["initialPage"];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: widget.arguments["imageUrl"],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: PhotoViewGallery.builder(
              // 图片总数
              itemCount: listData.length,
              // 配置初始化的图片
              pageController: PageController(initialPage: initialPage),
              onPageChanged: (index) {
                print(index);
              },
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(listData[index]["imageUrl"]));
              },
            ),
          ),
        ),
      ),
    );
  }
}
