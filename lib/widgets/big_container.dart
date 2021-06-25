import 'package:flutter/material.dart';
import 'package:ui_login_animation/colors/colors.dart';

class BigContainer extends StatelessWidget {
  const BigContainer({
    Key? key,
    required this.child,
    required this.offset,
  }) : super(key: key);

  final Widget child;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Container(
        height: 250,
        margin: EdgeInsets.symmetric(horizontal: 50.0),
        decoration: BoxDecoration(
          color: CustomColor.bigBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );
  }
}
