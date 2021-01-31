import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cubit/models/news.dart';
import 'package:flutter_cubit/services/core_service.dart';

class NewsService {
  Future<List<News>> getNews() async {
    var url = "http://newsapi.org/v2/top-headlines?" +
        "country=pl&" +
        "apiKey=a432649d0f7c4529bc60197b5de263d8";
    Response<String> response = await getFromApi<String>(url);

    Map<String, dynamic> json = jsonDecode(response.data);
    var articles = (json['articles'] as List).map((article) => News.fromJson(article)).toList();
    return Future.value(articles);
  }
}
