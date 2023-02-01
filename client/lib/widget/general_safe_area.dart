import 'package:flutter/material.dart';
import 'package:mybiseo_app/assets/coloring.dart';

class GeneralSafeArea extends StatelessWidget {
  const GeneralSafeArea(
      {Key? key,
      required this.child,
      this.topColor,
      this.bottomColor,
      this.bgColor})
      : super(key: key);

  final Widget child;
  final Color? topColor;
  final Color? bottomColor;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ColoredBox(
          color: bottomColor ?? Colors.white, // bottombar color
          child: SafeArea(
            top: false,
            child: ColoredBox(
              color: topColor ?? Coloring.bg_color, // statusbar color
              child: SafeArea(
                top: true,
                child: ColoredBox(
                  color: bgColor ?? Coloring.bg_color, // background color
                  child: child,
                ),
              ),
            ),
          ),
        ));
  }
}
