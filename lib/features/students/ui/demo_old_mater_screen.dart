// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:untitled6/core/helper/navigator.dart';
import 'package:untitled6/core/resource_manager/app_color.dart';
import 'package:untitled6/core/widgets/inputs/default_container.dart';
import 'package:untitled6/features/students/ui/demo_lecs_screen.dart';
import 'package:untitled6/features/students/ui/demo_level_quizes.dart';

class DemoOldMater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Color(0xff022D4F),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                      color: Color(0xffDEDEDE),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.dark_blue,
                      )),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Demonstrator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  DefaultContainer(
                      width: 350,
                      height: 60,
                      title: "sections",
                      onpressed: () {
                        navigateTo(context, screen: DemoLecs());
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultContainer(
                      width: 350,
                      height: 60,
                      title: "quiz",
                      onpressed: () {
                        navigateTo(context, screen: DemoLevelQuizes());
                      }),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
