import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/home/widgets/navigation_bar.dart';
import 'package:news_app/home/widgets/news_tile.dart';
import 'package:news_app/home/widgets/trending_news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyBottomNav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
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
                child: Row(
                  children: [
                    TrendingNewsCard(
                      imageUrl:
                          'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/04/1223_1741070091.jpg',
                      tag: 'Trending No. 1',
                      time: '2 Days Ago',
                      title:
                          'समय रैना-रणवीर अलाहबादिया पर भड़के शेखर सुमन:कहा- इन्हें देश से निकाल दो, सरकार से दरख्वास्त करूंगा कि ऐसे लोगों का शो हमेशा के लिए बंद हो',
                      author: 'Yash Chandra',
                    ),
                    TrendingNewsCard(
                      imageUrl:
                          'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/04/untitled-design-2025-03-04t191856432_1741096114.jpg',
                      tag: 'Trending No. 2',
                      time: '2 घंटे पहले',
                      title:
                          'चैंपियंस ट्रॉफी- ऑस्ट्रेलिया ने 265 रन का टारगेट दिया:चेज में कोहली के 8 हजार रन पूरे, अय्यर के साथ फिफ्टी पार्टनरशिप कर चुके',
                      author: 'Vikram Pratap Singh',
                    ),
                    TrendingNewsCard(
                      imageUrl:
                          'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/03/cover-18_1741018456.gif',
                      tag: 'Trending No. 3',
                      time: '11 घंटे पहले',
                      title:
                          'केजरीवाल-सिसोदिया के बाद आतिशी, गोपाल राय निशाने पर:14 कैग रिपोर्ट में पैसों की हेराफेरी, शराब घोटाले से बड़े एजुकेशन स्कैम का दावा',
                      author: 'संध्या द्विवेदी',
                    ),
                  ],
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
              Column(
                children: [
                  NewsTile(
                    imageUrl:
                        'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/03/cover-18_1741018456.gif',
                    time: '11 घंटे पहले',
                    title:
                        'केजरीवाल-सिसोदिया के बाद आतिशी, गोपाल राय निशाने पर:14 कैग रिपोर्ट में पैसों की हेराफेरी, शराब घोटाले से बड़े एजुकेशन स्कैम का दावा',
                    author: 'संध्या द्विवेदी',
                  ),
                  NewsTile(
                    imageUrl:
                        'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/04/untitled-design-2025-03-04t191856432_1741096114.jpg',
                    time: '2 घंटे पहले',
                    title:
                        'चैंपियंस ट्रॉफी- ऑस्ट्रेलिया ने 265 रन का टारगेट दिया:चेज में कोहली के 8 हजार रन पूरे, अय्यर के साथ फिफ्टी पार्टनरशिप कर चुके',
                    author: 'Vikram Pratap Singh',
                  ),
                  NewsTile(
                    imageUrl:
                        'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2025/03/04/1223_1741070091.jpg',
                    time: '2 Days Ago',
                    title:
                        'समय रैना-रणवीर अलाहबादिया पर भड़के शेखर सुमन:कहा- इन्हें देश से निकाल दो, सरकार से दरख्वास्त करूंगा कि ऐसे लोगों का शो हमेशा के लिए बंद हो',
                    author: 'Yash Chandra',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
