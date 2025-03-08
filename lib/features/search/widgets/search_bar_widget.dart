import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/common_controllers/news_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  newsController.searchNews(value);
                }
              },
              decoration: InputDecoration(
                hintText: 'Search News...',
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(
            () => newsController.isSearchLoading.value
                ? Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      newsController.searchNews(searchController.text);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Icon(Icons.search),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
