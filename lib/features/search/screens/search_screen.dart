import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/article/screens/article_display_screen.dart';
import 'package:news_app/features/common_controllers/news_controller.dart';
import 'package:news_app/features/home/widgets/news_tile.dart';
import 'package:news_app/features/search/widgets/search_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20),
              Obx(
                () => Column(
                  children: newsController.newsForYouList
                      .map(
                        (e) => NewsTile(
                          imageUrl: e.urlToImage ??
                              'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/03/cover-18_1741018456.gif',
                          time: e.publishedAt!,
                          title: e.title!,
                          author: e.author ?? 'Unknown',
                          onTap: () {
                            Get.to(() => ArticleDetailsScreen(news: e));
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
