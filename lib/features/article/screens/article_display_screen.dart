import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

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
                  height: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
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
                  'चैंपियंस ट्रॉफी- ऑस्ट्रेलिया ने 265 रन का टारगेट दिया:चेज में कोहली के 8 हजार रन पूरे, अय्यर के साथ फिफ्टी पार्टनरशिप कर चुके',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '2 days ago',
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
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Yash Chandra",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "The lorem ipsum is based on De finibus bonorum et malorum, a Latin text written by Cicero in 45 BC. Typographers and printers have used passages from this work for formatting since the 16th century.",
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
