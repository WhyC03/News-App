import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/theme.dart';
import 'package:news_app/features/home/controller/home_page_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NewsWave',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: HomePageController(),
    );
  }
}
