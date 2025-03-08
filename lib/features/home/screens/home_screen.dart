import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/features/article/screens/article_display_screen.dart';
import 'package:news_app/features/auth/controller/auth_controller.dart';
import 'package:news_app/features/common_controllers/news_controller.dart';
import 'package:news_app/features/home/widgets/news_tile.dart';
import 'package:news_app/features/home/widgets/news_tile_loading.dart';
import 'package:news_app/features/home/widgets/trending_loading_card.dart';
import 'package:news_app/features/home/widgets/trending_news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      child: Icon(Icons.dashboard),
                    ),
                    Text(
                      'NewsWave',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Poppins',
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final googleSignIn = GoogleSignIn();
                        if (await googleSignIn.isSignedIn()) {
                          await authController.googleSignOut();
                        } else {
                          await authController.signOut();
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest News',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: darkLabelColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isTrendingLoading.value
                        ? Row(
                            children: [
                              TrendingLoadingCard(),
                              TrendingLoadingCard(),
                            ],
                          )
                        : Row(
                            children: newsController.latestNewsList
                                .map((e) => TrendingNewsCard(
                                      imageUrl: e.urlToImage!,
                                      tag: 'Trending No. 1',
                                      time: e.publishedAt!,
                                      title: e.title!,
                                      author: e.author ?? 'Unknown',
                                      onTap: () {
                                        Get.to(
                                          () => ArticleDetailsScreen(
                                            news: e,
                                          ),
                                        );
                                      },
                                    ))
                                .toList(),
                          ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News For You',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: darkLabelColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
                  () => newsController.isNewsForYouLoading.value
                      ? Column(
                          children: [
                            NewsTileLoading(),
                            NewsTileLoading(),
                            NewsTileLoading(),
                          ],
                        )
                      : Column(
                          children: newsController.newsForYou5
                              .map(
                                (e) => NewsTile(
                                  imageUrl: e.urlToImage ??
                                      'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/03/cover-18_1741018456.gif',
                                  time: e.publishedAt!,
                                  title: e.title!,
                                  author: e.author ?? "Unknown",
                                  onTap: () {
                                    Get.to(
                                      () => ArticleDetailsScreen(
                                        news: e,
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList(),
                        ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tesla News',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: darkLabelColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
                  () => newsController.isTeslaLoading.value
                      ? Column(
                          children: [
                            NewsTileLoading(),
                            NewsTileLoading(),
                            NewsTileLoading(),
                          ],
                        )
                      : Column(
                          children: newsController.teslaNews5
                              .map(
                                (e) => NewsTile(
                                  imageUrl: e.urlToImage ??
                                      'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/03/cover-18_1741018456.gif',
                                  time: e.publishedAt!,
                                  title: e.title!,
                                  author: e.author ?? "Unknown",
                                  onTap: () {
                                    Get.to(
                                      () => ArticleDetailsScreen(
                                        news: e,
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList(),
                        ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Apple News',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: darkLabelColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isAppleLoading.value
                        ? Row(
                            children: [
                              TrendingLoadingCard(),
                              TrendingLoadingCard(),
                            ],
                          )
                        : Row(
                            children: newsController.appleNews5
                                .map((e) => TrendingNewsCard(
                                      imageUrl: e.urlToImage!,
                                      tag: 'Trending No. 1',
                                      time: e.publishedAt!,
                                      title: e.title!,
                                      author: e.author ?? 'Unknown',
                                      onTap: () {
                                        Get.to(
                                          () => ArticleDetailsScreen(
                                            news: e,
                                          ),
                                        );
                                      },
                                    ))
                                .toList(),
                          ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Business News',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: darkLabelColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
                  () => newsController.isBusinessLoading.value
                      ? Column(
                          children: [
                            NewsTileLoading(),
                            NewsTileLoading(),
                            NewsTileLoading(),
                          ],
                        )
                      : Column(
                          children: newsController.businessNews5
                              .map(
                                (e) => NewsTile(
                                  imageUrl: e.urlToImage ??
                                      'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/03/cover-18_1741018456.gif',
                                  time: e.publishedAt!,
                                  title: e.title!,
                                  author: e.author ?? "Unknown",
                                  onTap: () {
                                    Get.to(
                                      () => ArticleDetailsScreen(
                                        news: e,
                                      ),
                                    );
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
      ),
    );
  }
}
