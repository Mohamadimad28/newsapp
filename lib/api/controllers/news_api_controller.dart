import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_settings.dart';
import 'package:newsapp/api/models/news_api.dart';

class NewsApiController {
  NewsApiController._();

  static NewsApiController newsApiController = NewsApiController._();

  Future<List<Articles>> readNews() async {
    var url = Uri.parse(ApiSettings.business);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['articles'] as List;
      List<Articles> news = dataJsonArray
          .map((userJsonObjectMap) => Articles.fromJson(userJsonObjectMap))
          .toList();
      return news;
    }
    return [];
  }

  Future<List<Articles>> readNewsEntertainment() async {
    var url = Uri.parse(ApiSettings.entertainment);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['articles'] as List;
      List<Articles> news = dataJsonArray
          .map((userJsonObjectMap) => Articles.fromJson(userJsonObjectMap))
          .toList();
      return news;
    }
    return [];
  }

  Future<List<Articles>> readNewsHealth() async {
    var url = Uri.parse(ApiSettings.health);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['articles'] as List;
      List<Articles> news = dataJsonArray
          .map((userJsonObjectMap) => Articles.fromJson(userJsonObjectMap))
          .toList();
      return news;
    }
    return [];
  }

  Future<List<Articles>> readNewsScience() async {
    var url = Uri.parse(ApiSettings.science);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['articles'] as List;
      List<Articles> news = dataJsonArray
          .map((userJsonObjectMap) => Articles.fromJson(userJsonObjectMap))
          .toList();
      return news;
    }
    return [];
  }

  Future<List<Articles>> readNewsSports() async {
    var url = Uri.parse(ApiSettings.sports);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['articles'] as List;
      List<Articles> news = dataJsonArray
          .map((userJsonObjectMap) => Articles.fromJson(userJsonObjectMap))
          .toList();
      return news;
    }
    return [];
  }

  Future<List<Articles>> readNewsTechnology() async {
    var url = Uri.parse(ApiSettings.technology);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['articles'] as List;
      List<Articles> news = dataJsonArray
          .map((userJsonObjectMap) => Articles.fromJson(userJsonObjectMap))
          .toList();
      return news;
    }
    return [];
  }
}
