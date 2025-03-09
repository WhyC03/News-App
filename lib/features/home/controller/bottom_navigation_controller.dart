import 'package:get/get.dart';
import 'package:news_app/features/home/screens/home_screen.dart';
import 'package:news_app/features/search/screens/search_screen.dart';
import 'package:news_app/features/saved_items/screens/saved_news.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;
  var pages = [
    HomeScreen(),
    SearchScreen(),
    SavedNewsScreen()
  ];
}
