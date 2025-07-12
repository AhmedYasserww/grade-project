// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/core/services/service_locator.dart';
import 'package:untitled6/features/demonstrator/data/repo/add_post_repo.dart';
import 'package:untitled6/features/demonstrator/ui/manager/add_post_cubit/add_post_cubit.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_ElevatedButton_AddLectureScreen.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_TextField_PostDescription_AddPostScreen.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_TopBar_Welome_AddLectureScreen.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_name_Add%20a%20lecture_AddLectureScreen.dart';

class AddPostScreen extends StatefulWidget {
  final String userName;

  const AddPostScreen({super.key, required this.userName});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  late TextEditingController _contentController;
@override
void initState() {
  _contentController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddPostCubit(getIt.get<AddPostRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  CustomTopbarWelomeAddlecturescreen(
                    text1: '👋 ${widget.userName}',
                  ),
                  const SizedBox(height: 24),
                  const CustomName(text: "Add Post"),
                  const SizedBox(height: 25),
                  CustomTextfieldPostdescriptionAddpostscreen(
                    hintText: "post description",
                    controller: _contentController,
                  ),
                  const SizedBox(height: 32),
                  CustomElevatedbuttonAddlecturescreen(
                    contentController: _contentController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
