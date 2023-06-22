import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final double width;
  final double height;
  final String src; // 图片地址，必传参数

  const ImagePage(
      {super.key,
      this.width = double.infinity,
      this.height = 250,
      required this.src});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        src,
        fit: BoxFit.cover,
      ),
    );
  }
}
