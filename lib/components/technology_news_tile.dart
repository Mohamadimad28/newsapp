import 'package:flutter/material.dart';
import 'package:newsapp/api/controllers/news_api_controller.dart';
import 'package:newsapp/api/models/news_api.dart';
import 'package:newsapp/provider/provider_api.dart';
import 'package:newsapp/screens/details_screen.dart';
import 'package:provider/provider.dart';

class TechnologyNewsTitle extends StatefulWidget {
  TechnologyNewsTitle({Key? key}) : super(key: key);

  @override
  State<TechnologyNewsTitle> createState() => _TechnologyNewsTitleState();
}

class _TechnologyNewsTitleState extends State<TechnologyNewsTitle> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articles>>(
      future: NewsApiController.newsApiController.readNewsTechnology(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          Provider.of<ApiProvider>(context, listen: false).newsListTechnology =
              snapshot.data!;
          return SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: Provider.of<ApiProvider>(context, listen: false)
                    .newsListTechnology
                    .length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              Provider.of<ApiProvider>(context, listen: false)
                                  .newsListTechnology[index]),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Hero(
                              tag: Provider.of<ApiProvider>(context,
                                      listen: false)
                                  .newsListTechnology[index]
                                  .title!,
                              child: Container(
                                height: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  image: DecorationImage(
                                      image: Provider.of<ApiProvider>(context,
                                                      listen: false)
                                                  .newsListTechnology[index]
                                                  .urlToImage !=
                                              null
                                          ? NetworkImage(
                                              Provider.of<ApiProvider>(context,
                                                      listen: false)
                                                  .newsListTechnology[index]
                                                  .urlToImage!)
                                          : const NetworkImage(
                                              'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg')),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            flex: 5,
                            child: Column(
                              children: [
                                Text(
                                  Provider.of<ApiProvider>(context,
                                          listen: false)
                                      .newsListTechnology[index]
                                      .title!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Provider.of<ApiProvider>(context, listen: false)
                                            .newsListTechnology[index]
                                            .content !=
                                        null
                                    ? Text(
                                        Provider.of<ApiProvider>(context,
                                                listen: false)
                                            .newsListTechnology[index]
                                            .content!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black45,
                                        ),
                                      )
                                    : const Text("NO Content"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
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
/*
InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailsScreen(widget.data),
        //   ),
        // );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(12.0),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Hero(
                tag: "${widget.data.title!}",
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.data.urlToImage!),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  Text(
                    widget.data.title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.data.content!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );*/
