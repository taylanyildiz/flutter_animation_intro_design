import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
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
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 80.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );
  }
}
