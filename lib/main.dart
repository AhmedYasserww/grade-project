import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled6/core/services/api_service.dart';
import 'package:untitled6/core/services/service_locator.dart';
import 'package:untitled6/features/students/data/repos/all_courses_repo/all_courses_repo_imp.dart';
import 'package:untitled6/features/students/data/repos/all_posts_repo/all_posts_repo_imp.dart';
import 'package:untitled6/features/students/ui/Bottom_nav_bar.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // لازم لأي كود async في main
//
//   final dio = Dio();
//   dio.options.headers['Authorization'] = 'Bearer YOUR_TOKEN_HERE'; // أو ضيفه زي ما بتحطه في المشروع
//
//   final apiService = ApiService(dio: dio);
//   final repo = AllPostsRepoImp(apiService: apiService);
//
//   final result = await repo.fetchAllPosts();
//
//   result.fold(
//         (failure) => print('❌ Error: ${failure.errorMessage}'),
//         (courses) {
//       print('✅ Courses Fetched: ${courses.length}');
//       for (var course in courses) {
//         print('📚 Course Title: ${course.comments}');
//         print('👨‍🏫 Instructor: ${course.content}');
//         print('🎓 Level: ${course.attachments}');
//         print('------------------------');
//       }
//     },
//   );
//
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          fontFamily: "Plus Jakarta Sans",
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const BottonNavBtn(),
    );
  }
}
