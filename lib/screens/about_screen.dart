import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About App',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: const Text(
          'This news app provides the latest updates on sports, technology, science, and health.\n\n Stay informed on current events and keep up with the latest trends in these areas.\n\n Get access to a variety of news sources, all in one place.\n\nFeatures:\n\nPersonalized news feed based on user preferences and interestsBreaking news alerts and notificationsAbility to save articles for offline readingAccess to a range of news categories, including sports, technology, science, and healthUser-friendly interface for easy navigation and information access.\n\nThis overview should give users a general idea of what to expect from your news app, and highlight its key features.\n',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
