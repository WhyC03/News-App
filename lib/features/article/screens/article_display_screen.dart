import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/theme.dart';
import 'package:news_app/features/saved_items/controller/saved_controller.dart';
import 'package:news_app/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final NewsModel news;
  const ArticleDetailsScreen({super.key, required this.news});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  final SavedNewsController savedNewsController =
      Get.find<SavedNewsController>();

  @override
  void initState() {
    super.initState();
    isBookmarked = savedNewsController.isNewsSaved(widget.news);
  }

  Future<void> _launchURL(String? url) async {
    if (url == null) return;

    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final formattedTime = formatDateTime(widget.news.publishedAt!);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () async {
          setState(() {
            isBookmarked = !isBookmarked;
          });

          if (isBookmarked) {
            await savedNewsController.saveNews(widget.news);
          } else {
            await savedNewsController.removeNews(widget.news);
          }
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
              size: 30,
            ),
          ),
        ),
      ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: widget.news.urlToImage ??
                                    'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/04/untitled-design-2025-03-04t191856432_1741096114.jpg',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 50,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Image not available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.news.title!,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: 13,
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
                            widget.news.author![0],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            widget.news.author ?? 'Unknown',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 19,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(widget.news.description ?? 'No Description',
                        style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        _launchURL(widget.news.url);
                      },
                      child: Text(
                        "Read More ....",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Color(0xff6A5ACD),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
