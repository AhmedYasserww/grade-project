// ignore_for_file: use_super_parameters, file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/core/services/service_locator.dart';
import 'package:untitled6/features/demonstrator/data/models/add_materials_model/material_model.dart';
import 'package:untitled6/features/demonstrator/data/repo/add_material_repo/add_material_repo.dart';
import 'package:untitled6/features/demonstrator/ui/manager/add_material_cubit/add_material_cubit.dart';
import 'package:untitled6/features/doctors/ui/widgets/Custom_UploadContainer.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_TopBar_Welome_AddLectureScreen.dart';
import 'package:untitled6/features/doctors/ui/widgets/custom_name_Add%20a%20lecture_AddLectureScreen.dart';
import 'package:untitled6/features/doctors/ui/widgets/CustomTextField.dart';

class AddLectureScreen extends StatefulWidget {
  final String userName;

  const AddLectureScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<AddLectureScreen> createState() => _AddLectureScreenState();
}

class _AddLectureScreenState extends State<AddLectureScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController courseIdController = TextEditingController();
  File? selectedFile;

  void onFilePicked(File file) {
    setState(() {
      selectedFile = file;
    });
  }

  void submitMaterial(BuildContext context) {
    final title = titleController.text;
    final status = statusController.text;
    final courseId = courseIdController.text;

    if (title.isEmpty || status.isEmpty || selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('❌ Please complete all fields and upload file'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final material = MaterialModel(
      title: title,
      status: status,
      file: selectedFile!,
      courseId: courseId,
    );

    context.read<AddMaterialCubit>().addMaterial(material);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddMaterialCubit(getIt.get<AddMaterialRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<AddMaterialCubit, AddMaterialState>(
            listener: (context, state) {
              if (state is AddMaterialSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("✅ Material added successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is AddMaterialFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("❌ Failed: ${state.errorMessage}"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    CustomTopbarWelomeAddlecturescreen(text1: '👋 ${widget.userName}'),
                    const SizedBox(height: 24),
                    const CustomName(text: "Add lecture"),
                    const SizedBox(height: 24),
                    CustomTextField2(hintText: "Lecture title", controller: titleController),
                    CustomTextField2(hintText: "Lecture status", controller: statusController),
                    CustomTextField2(hintText: "course id", controller: courseIdController),
                    const SizedBox(height: 24),
                    UploadContainer(
                      text: "Upload file",
                      onFileSelected: onFilePicked,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: state is AddMaterialLoading ? null : () => submitMaterial(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF022B54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: state is AddMaterialLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        "Add Lecture",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
