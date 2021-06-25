import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ui_login_animation/controllers/controller.dart';
import 'package:ui_login_animation/widgets/widget.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  final pageView = Get.find<PageViewController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (PageViewController _) => Scaffold(
        body: Stack(
          children: [
            _bigContainer(),
            _smallContainer(),
          ],
        ),
      ),
    );
  }

  _smallContainer() {
    return Positioned(
      top: 100.0,
      left: 0,
      right: 0,
      child: SmallContainer(
        offset: Offset(3 * pageView.offset * (1 - pageView.page), 0.0),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 10.0,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(.4),
                ),
                child: Icon(
                  FontAwesomeIcons.yinYang,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 35.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(.3),
                      ),
                      child: Icon(
                        FontAwesomeIcons.angellist,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(.3),
                      ),
                      child: Icon(
                        FontAwesomeIcons.weight,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bigContainer() {
    return Positioned(
      top: 150.0,
      left: 0,
      right: 0,
      child: BigContainer(
        offset: Offset(1 * pageView.offset * (1 - pageView.page), 0.0),
        child: Stack(
          children: [
            Positioned(
              bottom: 40.0,
              left: 0.0,
              right: 0.0,
              child: Icon(
                Icons.workspaces_rounded,
                color: Colors.white,
                size: 100.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
