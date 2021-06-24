import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_design_login/controllers/controller.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (PageViewController page) {
      return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Stack(
          children: [
            Positioned(
              top: 200.0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: Offset((2 - 2 * page.page!) * page.offset, 0),
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
                          bottom: 30.0,
                          left: 0.0,
                          right: 0.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(15.0),
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
                                  padding: EdgeInsets.all(15.0),
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
                                padding: EdgeInsets.all(15.0),
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
                        )
                      ],
                    )),
              ),
            ),
            Positioned(
              top: 140.0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: Offset((5 - 5 * page.page!) * page.offset, 0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Color(0xff2663FA),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15.0),
                      Icon(
                        Icons.person,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.wrap_text,
                            size: 25.0,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.ac_unit,
                            size: 25.0,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.accessible_outlined,
                            size: 25.0,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
