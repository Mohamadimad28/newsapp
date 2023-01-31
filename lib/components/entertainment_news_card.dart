import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/controllers/news_api_controller.dart';
import 'package:newsapp/api/models/news_api.dart';
import 'package:newsapp/provider/provider_api.dart';
import 'package:provider/provider.dart';

import '../screens/details_screen.dart';

class EntertainmentNewsCard extends StatefulWidget {
  EntertainmentNewsCard();

  @override
  State<EntertainmentNewsCard> createState() => _EntertainmentNewsCardState();
}

class _EntertainmentNewsCardState extends State<EntertainmentNewsCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articles>>(
      future: NewsApiController.newsApiController.readNewsEntertainment(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          Provider.of<ApiProvider>(context, listen: false)
              .newsListEntertainment = snapshot.data!;
          return CarouselSlider.builder(
            itemCount: Provider.of<ApiProvider>(context, listen: false)
                .newsListEntertainment
                .length,
            itemBuilder: (context, index, id) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                          Provider.of<ApiProvider>(context, listen: false)
                              .newsListEntertainment[index]),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Provider.of<ApiProvider>(context, listen: false)
                                    .newsListEntertainment[index]
                                    .urlToImage !=
                                null
                            ? NetworkImage(
                                Provider.of<ApiProvider>(context, listen: false)
                                    .newsListEntertainment[index]
                                    .urlToImage!)
                            : const NetworkImage(
                                'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg')),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Provider.of<ApiProvider>(context, listen: false)
                              .newsListEntertainment[index]
                              .title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          Provider.of<ApiProvider>(context, listen: false)
                              .newsListEntertainment[index]
                              .source!
                              .name!,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.warning,
                  size: 80,
                  color: Colors.black45,
                ),
                Text(
                  "No DATA",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
