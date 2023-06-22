import 'package:flutter/material.dart';

// 自定义的组件，支持缓存
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({Key? key, required this.child, this.keepAlive = true})
      : super(key: key);

  final Widget? child; // 内部子组件
  final bool keepAlive; // 是否保持状态

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive状态需要更新，实现在 AutomaticKeepAliveCLientMixin中
      updateKeepAlive();
    }
  }
}
