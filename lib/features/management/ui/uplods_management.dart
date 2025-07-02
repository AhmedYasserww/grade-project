
// ignore_for_file: use_super_parameters, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_TopBar_Welome_AddLectureScreen.dart';
import 'package:untitled6/features/management/ui/widgets/custom_name_table_in_management.dart';

import '../../doctors/ui/widgets/custom_1_8Pages _UploadScreen.dart';
import '../../doctors/ui/widgets/custom_Row_number One in table_uploadsScreen.dart';


class UploadsScreenManagemebt extends StatelessWidget {
  final String userName;

  const UploadsScreenManagemebt({Key? key, required this.userName}) : super(key: key); // ✅ إضافته هنا

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTopbarWelomeAddlecturescreen(text1: '👋 ${userName}'),
                const SizedBox(height: 35),
                const SizedBox(height: 40),
                CustomNamestablesInUploadscreenManagement(),
                Divider(color: Colors.grey.shade700,),
                Custom_Row_number_One_in_table_uploadsScreen(),
                Spacer(),
                Custom_1_8_Pages(),
                Text("1 of 8 pages (84 items)", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
