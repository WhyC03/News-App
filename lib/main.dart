import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/features/auth/screens/auth_screen.dart';
import 'package:news_app/features/home/controller/home_page_controller.dart';
import 'package:news_app/features/splash/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/auth-screen', page: () => AuthScreen()),
        GetPage(name: '/home-screen', page: () => HomePageController()),
      ],
     
    );
  }
}
