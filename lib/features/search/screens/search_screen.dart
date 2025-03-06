import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/news_tile.dart';
import 'package:news_app/features/search/widgets/search_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SearchWidget(),
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
