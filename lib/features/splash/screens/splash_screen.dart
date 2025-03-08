import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/logo_widget.dart';
import 'package:news_app/features/splash/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LogoWidget(),
          )
        ],
      ),
    );
  }
}
