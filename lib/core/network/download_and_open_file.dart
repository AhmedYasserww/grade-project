import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadAndOpenFile(BuildContext context, String relativeUrl) async {
  final baseUrl = "https://a3a3-156-197-155-244.ngrok-free.app/storage/";
  final fullUrl = baseUrl + relativeUrl;

  try {
    // تحديد المسار
    Directory directory = await getApplicationDocumentsDirectory();
    String fileName = relativeUrl.split("/").last;
    String filePath = "${directory.path}/$fileName";

    // تحميل الملف
    Dio dio = Dio();
    await dio.download(fullUrl, filePath);

    // عرض سناك بار بعد التحميل
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("✅ File downloaded to:\n$filePath"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 4),
      ),
    );

    // محاولة فتح الملف
    final result = await OpenFile.open(filePath);

    if (result.type == ResultType.noAppToOpen) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("❌ No app found to open this file"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  } catch (e) {
    // خطأ في التحميل
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("❌ Error downloading/opening file:\n$e"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ),
    );
  }
}
