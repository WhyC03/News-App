import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/news_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final NewsModel news;
  const ArticleDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(
                    width: 80,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new),
                        Text(
                          "Back",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            news.urlToImage ??
                                'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/04/untitled-design-2025-03-04t191856432_1741096114.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  news.title!,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  news.publishedAt!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(
                        news.author![0],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      news.author ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  news.description ?? 'No Description',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
