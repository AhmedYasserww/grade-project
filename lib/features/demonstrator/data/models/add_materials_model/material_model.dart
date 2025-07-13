import 'dart:io';
import 'package:dio/dio.dart';

class MaterialModel {
  final String title;
  final String status;
  final File file;
  final String courseId;

  MaterialModel({
    required this.title,
    required this.status,
    required this.file,
    required this.courseId,
  });

  Future<FormData> toFormData() async {
    // نتحقق إن الملف موجود
    if (!await file.exists()) {
      throw Exception("❌ File doesn't exist at path: ${file.path}");
    }

    final fileName = file.path.split('/').last;

    return FormData.fromMap({
      'title': title,
      'status': status,
      'file': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      'course_id': courseId,
    });
  }
}
