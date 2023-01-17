import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Color? color;
  final VoidCallback? callback;
  final double? height;
  final double? width;
  final double? marginTop;
  final double? marginLeft;
  final double? marginRight;
  final double? marginBottom;
  final Widget? child;
  final double? elevation;
  final bool? enabled;
  final BoxDecoration? decoration;
  final double? borderRadius;

  const ButtonComponent(
      {super.key,
      this.color,
      this.callback,
      this.height,
      this.width,
      this.marginTop,
      this.marginBottom,
      this.marginLeft,
      this.marginRight,
      this.child,
      this.decoration,
      this.elevation,
      this.borderRadius,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: decoration,
        margin: EdgeInsets.only(
            top: marginTop ?? 0,
            left: marginLeft ?? 0,
            right: marginRight ?? 0,
            bottom: marginBottom ?? 0),
        child: Material(
          elevation: elevation ?? 2,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          color: color,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: enabled! ? callback : null,
            child: Align(alignment: Alignment.center, child: child),
          ),
        ));
  }
}
