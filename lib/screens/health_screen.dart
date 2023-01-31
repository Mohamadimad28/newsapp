import 'package:flutter/material.dart';
import 'package:newsapp/components/health_news_tile.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Health News',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: HealthNewsTitle()),
        ],
      ),
    );
  }
}
