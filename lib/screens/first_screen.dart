import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_design_login/controllers/controller.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (PageViewController page) => Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Stack(
          children: [
            Positioned(
              top: 200.0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: Offset(-2 * page.offset, 0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xff2D21DE),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40.0,
                        left: 0,
                        right: 0,
                        child: Icon(
                          Icons.camera_enhance,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                      Positioned(
                        top: 60.0,
                        left: 100,
                        child: Icon(
                          Icons.light_rounded,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      Positioned(
                        top: 60.0,
                        right: 100,
                        child: Icon(
                          Icons.compare_arrows_sharp,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 300.0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: Offset(-5 * page.offset, 0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Color(0xff2663FA),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.chair,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.6),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.holiday_village,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
