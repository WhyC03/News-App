import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/home/controller/bottom_navigation_controller.dart';
import 'package:news_app/features/search/widgets/navigation_bar.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: MyBottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
    );
  }
}
