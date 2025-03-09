import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/models/news_model.dart';

class SavedNewsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  RxList<NewsModel> savedNews = <NewsModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSavedNews();
  }

  Future<void> saveNews(NewsModel news) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return;

      // Convert news to map
      final newsMap = news.toJson();
      
      // Add to Firestore
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('savedItems')
          .doc(news.title) // Using title as document ID
          .set(newsMap);

      // Add to local list
      savedNews.add(news);
      Get.snackbar(
        'Success', 
        'News saved successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error', 
        'Failed to save news',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> getSavedNews() async {
    try {
      isLoading.value = true;
      final userId = _auth.currentUser?.uid;
      if (userId == null) return;

      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('savedItems')
          .get();

      savedNews.value = snapshot.docs
          .map((doc) => NewsModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      Get.snackbar(
        'Error', 
        'Failed to fetch saved news',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeNews(NewsModel news) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return;

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('savedItems')
          .doc(news.title)
          .delete();

      savedNews.removeWhere((item) => item.title == news.title);
      Get.snackbar(
        'Success', 
        'News removed from saved items',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error', 
        'Failed to remove news',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  bool isNewsSaved(NewsModel news) {
    return savedNews.any((item) => item.title == news.title);
  }
}