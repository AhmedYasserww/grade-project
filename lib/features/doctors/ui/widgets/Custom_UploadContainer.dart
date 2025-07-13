// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadContainer extends StatelessWidget {
  final String text;
  final void Function(File file) onFileSelected;

  const UploadContainer({
    Key? key,
    required this.text,
    required this.onFileSelected,
  }) : super(key: key);

  Future<void> _pickFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );
      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        onFileSelected(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Selected: ${file.path.split('/').last}'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // User canceled
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Error picking file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pickFile(context),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_upload_outlined,
                  color: Color(0xFF022B54), size: 30),
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
