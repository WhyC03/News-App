import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> latestNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNews5 = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> teslaNews5 = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> businessNews5 = <NewsModel>[].obs;

  RxBool isTrendingLoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isBusinessLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isSearchLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getNewsForYou();
    getTeslaNews();
    getAppleNews();
    getBusinessNews();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseURL =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2a81e77de36d4a189ec22b9b5ba30294';

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          latestNewsList.add(
            NewsModel.fromJson(news),
          );
        }
      } else {
        log("SomeThing went Wrong in Trending News");
      }
    } catch (e) {
      log(e.toString());
    }
    isTrendingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    var baseURL =
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=2a81e77de36d4a189ec22b9b5ba30294';

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          newsForYouList.add(
            NewsModel.fromJson(news),
          );
        }
        newsForYou5 = newsForYouList.sublist(0, 5).obs;
      } else {
        log("SomeThing went Wrong in Get News For You");
      }
    } catch (e) {
      log(e.toString());
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getAppleNews() async {
    isAppleLoading.value = true;
    var baseURL =
        'https://newsapi.org/v2/everything?q=apple&from=2025-03-05&to=2025-03-05&sortBy=popularity&apiKey=2a81e77de36d4a189ec22b9b5ba30294';

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          appleNewsList.add(
            NewsModel.fromJson(news),
          );
        }
        appleNews5 = appleNewsList.sublist(0, 5).obs;
      } else {
        log("SomeThing went Wrong in Apple News");
      }
    } catch (e) {
      log(e.toString());
    }
    isAppleLoading.value = false;
  }

  Future<void> getTeslaNews() async {
    isTeslaLoading.value = true;
    var baseURL =
        'https://newsapi.org/v2/everything?q=tesla&from=2025-02-07&sortBy=publishedAt&apiKey=2a81e77de36d4a189ec22b9b5ba30294';

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          teslaNewsList.add(
            NewsModel.fromJson(news),
          );
        }
        teslaNews5 = teslaNewsList.sublist(0, 5).obs;
      } else {
        log("SomeThing went Wrong in Tesla News");
      }
    } catch (e) {
      log(e.toString());
    }

    isTeslaLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBusinessLoading.value = true;
    var baseURL =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2a81e77de36d4a189ec22b9b5ba30294';

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          businessNewsList.add(
            NewsModel.fromJson(news),
          );
        }
        businessNews5 = businessNewsList.sublist(0, 5).obs;
      } else {
        log("SomeThing went Wrong in Business News");
      }
    } catch (e) {
      log(e.toString());
    }
    isBusinessLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isSearchLoading.value = true;
    var baseURL =
        'https://newsapi.org/v2/everything?q=$search&apiKey=2a81e77de36d4a189ec22b9b5ba30294';

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        newsForYouList.clear();
        int i = 0;
        for (var news in articles) {
          i++;
          newsForYouList.add(
            NewsModel.fromJson(news),
          );
          if (i == 10) {
            break;
          }
        }
      } else {
        log("SomeThing went Wrong in Searching News");
      }
    } catch (e) {
      log(e.toString());
    }
    isSearchLoading.value = false;
  }
}
