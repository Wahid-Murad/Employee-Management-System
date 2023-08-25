import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Decoration? decoration;
  final Color? color;
  final Widget child;

  const ContainerWidget(
      {super.key,
      this.width,
      this.height,
      this.decoration,
      this.color,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      decoration: decoration,
      child: child,
    );
  }
}
