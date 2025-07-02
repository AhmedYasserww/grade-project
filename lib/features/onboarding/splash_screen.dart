// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:untitled6/core/helper/navigator.dart';
import 'package:untitled6/core/resource_manager/app_assets.dart';
import 'package:untitled6/features/onboarding/onBoarding_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
   void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      navigateTo(context, screen:OnboardingScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff091B29),
              ),
              child: Center(
                child: Image(image: AssetImage(AppAssets.logo)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}