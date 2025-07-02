// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:untitled6/features/doctors/ui/AddLectureScreen.dart';
import 'package:untitled6/features/doctors/ui/AddPostScreen.dart';
import 'package:untitled6/features/doctors/ui/AddTaskScreen.dart';
import 'package:untitled6/features/doctors/ui/UploadsScreen.dart';



import 'custom_build_Material_Button.dart';

class CustomPositionedFourItemsHomeDoctor extends StatelessWidget {
  const CustomPositionedFourItemsHomeDoctor({super.key});
  void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200,
      left:0,
      right: 0,
      child: Column(
        children: [
          CustombuildMaterialButton("Add lecture",
                  () => navigateTo(context, AddLectureScreen(userName: "sayed"))),
          CustombuildMaterialButton(
             "Add Post", () => navigateTo(context, AddPostScreen(userName: "sayed",))),
          CustombuildMaterialButton(
             "Add Task", () => navigateTo(context, AddTaskScreen(userName: "sayed",))),
          CustombuildMaterialButton(
             "Uploads", () => navigateTo(context, UploadsScreen(userName: "sayed"))),
        ],
      ),
    );
  }
}
