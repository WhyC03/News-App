import 'package:flutter/material.dart';
import 'package:news_app/constants/shimmer_effect/loading_container.dart';

class NewsTileLoading extends StatelessWidget {
  const NewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          LoadingContainer(
            width: 120,
            height: 120,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    LoadingContainer(
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: 10),
                    LoadingContainer(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                LoadingContainer(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: 15),
                SizedBox(height: 5),
                LoadingContainer(
                    width: MediaQuery.of(context).size.width * 0.5, height: 15),
                SizedBox(height: 10),
                LoadingContainer(
                    width: MediaQuery.of(context).size.width * 0.2, height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
