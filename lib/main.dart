import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled6/core/services/service_locator.dart';
import 'package:untitled6/features/students/ui/Bottom_nav_bar.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}



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
