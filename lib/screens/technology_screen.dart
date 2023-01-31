import 'package:flutter/material.dart';
import 'package:newsapp/components/technology_news_tile.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text(
            'Technology News',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: TechnologyNewsTitle()),
        ],
      ),
    );
  }
}
