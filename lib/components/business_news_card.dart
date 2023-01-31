import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/models/news_api.dart';
import 'package:newsapp/modles/news_modle.dart';
import 'package:newsapp/provider/provider_api.dart';
import 'package:provider/provider.dart';

import '../screens/details_screen.dart';

class BusinessNewsCard extends StatefulWidget {
  BusinessNewsCard();

  @override
  State<BusinessNewsCard> createState() => _BusinessNewsCardState();
}

class _BusinessNewsCardState extends State<BusinessNewsCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articles>>(
      future: Provider.of<ApiProvider>(context).future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          Provider.of<ApiProvider>(context, listen: false).newsListBusiness =
              snapshot.data!;
          return CarouselSlider.builder(
            itemCount: Provider.of<ApiProvider>(context, listen: false)
                .newsListBusiness
                .length,
            itemBuilder: (context, index, id) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                          Provider.of<ApiProvider>(context, listen: false)
                              .newsListBusiness[index]),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Provider.of<ApiProvider>(context, listen: false)
                                    .newsListBusiness[index]
                                    .urlToImage !=
                                null
                            ? NetworkImage(
                                Provider.of<ApiProvider>(context, listen: false)
                                    .newsListBusiness[index]
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
                              .newsListBusiness[index]
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
                              .newsListBusiness[index]
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
