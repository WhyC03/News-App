import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/article/screens/article_display_screen.dart';
import 'package:news_app/features/home/widgets/news_tile.dart';
import 'package:news_app/features/home/widgets/news_tile_loading.dart';
import 'package:news_app/features/saved_items/controller/saved_controller.dart';

class SavedNewsScreen extends StatelessWidget {
  final SavedNewsController savedNewsController = Get.put(SavedNewsController());
  SavedNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Saved Bookmarks",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => savedNewsController.isLoading.value
                      ? ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => const NewsTileLoading(),
                        )
                      : savedNewsController.savedNews.isEmpty
                          ? const Center(
                              child: Text('No saved news found'),
                            )
                          : ListView.builder(
                              itemCount: savedNewsController.savedNews.length,
                              itemBuilder: (context, index) {
                                final news = savedNewsController.savedNews[index];
                                return NewsTile(
                                  imageUrl: news.urlToImage ?? 
                                    'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/03/cover-18_1741018456.gif',
                                  title: news.title!,
                                  time: news.publishedAt!,
                                  author: news.author ?? 'Unknown',
                                  onTap: () {
                                    Get.to(() => ArticleDetailsScreen(news: news));
                                  },
                                );
                              },
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
