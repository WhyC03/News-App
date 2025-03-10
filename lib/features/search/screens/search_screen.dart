// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/article/screens/article_display_screen.dart';
import 'package:news_app/features/common_controllers/news_controller.dart';
import 'package:news_app/features/home/widgets/news_tile.dart';
import 'package:news_app/features/search/widgets/search_bar_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();

    @override
    void dispose() {
      super.dispose();
      searchController.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SearchWidget(
                searchController: searchController,
              ),
              SizedBox(height: 20),
              Obx(
                () => newsController.searchNewsList.isNotEmpty
                    ? Column(
                        children: newsController.searchNewsList
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
                      )
                    : Column(
                        children: newsController.newsForYou5
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
