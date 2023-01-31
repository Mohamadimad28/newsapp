import 'package:flutter/material.dart';
import 'package:newsapp/components/business_news_card.dart';
import 'package:newsapp/components/entertainment_news_card.dart';
import 'package:newsapp/components/sport_news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text(
            'business News',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BusinessNewsCard(),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'entertainment News',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          EntertainmentNewsCard(),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Sports News',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SportNewsCard(),
        ],
      ),
    );
  }
}
