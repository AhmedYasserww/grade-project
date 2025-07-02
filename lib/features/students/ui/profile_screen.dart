// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:untitled6/core/helper/navigator.dart';
import 'package:untitled6/core/resource_manager/app_assets.dart';
import 'package:untitled6/core/widgets/inputs/default_container.dart';
import 'package:untitled6/features/students/ui/demonstrator_stud_screen.dart';
import 'package:untitled6/features/students/ui/edit_profile_screen.dart';
import 'package:untitled6/features/students/ui/old_materials_screen.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 2;
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
              height: 70,
            ),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(AppAssets.profile_image),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ahmed Hassan",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                          onPressed: () {
                            navigateTo(context, screen: EditProfile());
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  DefaultContainer(
                      width: 350,
                      height: 65,
                      title: "Old matrials",
                      onpressed: () {
                        navigateTo(context, screen: OldMaterials());
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultContainer(
                      width: 350,
                      height: 65,
                      title: "Demonstrator",
                      onpressed: () {
                        navigateTo(context, screen: DemonstartorStudents());
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultContainer(
                      width: 350,
                      height: 65,
                      title: "Doctors",
                      onpressed: () {}),
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
