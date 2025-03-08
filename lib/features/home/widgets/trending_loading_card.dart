import 'package:flutter/material.dart';
import 'package:news_app/constants/shimmer_effect/loading_container.dart';

class TrendingLoadingCard extends StatelessWidget {
  const TrendingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(5),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          LoadingContainer(
              width: MediaQuery.of(context).size.width, height: 200),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoadingContainer(
                  width: MediaQuery.of(context).size.width * 0.35, height: 15),
              LoadingContainer(
                  width: MediaQuery.of(context).size.width * 0.2, height: 15),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoadingContainer(
                  width: MediaQuery.of(context).size.width * 0.65, height: 20),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoadingContainer(
                  width: MediaQuery.of(context).size.width * 0.5, height: 20),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 10),
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
        ],
      ),
    );
  }
}
