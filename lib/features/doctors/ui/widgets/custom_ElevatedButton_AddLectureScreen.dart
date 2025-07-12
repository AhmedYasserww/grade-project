// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/features/demonstrator/ui/manager/add_post_cubit/add_post_cubit.dart';

class CustomElevatedbuttonAddlecturescreen extends StatelessWidget {
  final TextEditingController contentController;

  const CustomElevatedbuttonAddlecturescreen({
    super.key,
    required this.contentController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          final content = contentController.text.trim();
          if (content.isNotEmpty) {
            context.read<AddPostCubit>().addPost(content, context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("⚠️ Post content cannot be empty"),
                backgroundColor: Colors.orange,
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF022B54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          "Add",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
