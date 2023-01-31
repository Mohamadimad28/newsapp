import 'package:flutter/material.dart';
import 'package:newsapp/api/models/news_api.dart';
import 'package:newsapp/router/app_router.dart';
import 'package:newsapp/screens/webView_screen.dart';

class DetailsScreen extends StatelessWidget {
  Articles articles;

  DetailsScreen(this.articles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Text(
              articles.title!,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              articles.source!.name!,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Hero(
              tag: "${articles.title!}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: articles.urlToImage != null
                    ? Image.network(articles.urlToImage!)
                    : Image.asset('images/no_image.jpg'),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            articles.description != null
                ? Text(
                    articles.description!,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  )
                : const Text('No description'),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20.0,
            ),
            articles.publishedAt != null
                ? Text(
                    articles.publishedAt!,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  )
                : const Text('No publishedAt'),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20.0,
            ),
            articles.content != null
                ? Text(
                    articles.content!,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  )
                : const Text('No content'),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // AppRouter.goToScreen(WebViewScreen(articles.url!));
            //   },
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size(300, 58),
            //     primary: const Color(0xFF6A90F2),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            //   child: const Text('GO TO Location By Link'),
            // ),
          ],
        ),
      ),
    );
  }
}

/*DetailsScreen
Consumer<ApiProvider>(
      builder: (context, provider, widget) {
        return
      },
    );*/
