import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/theme.dart';
import 'package:news_app/features/home_page_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: HomePageController() ,
    );
  }
}
