import 'package:flutter/material.dart';

class News {
  final String author;
  final String title;
  final String content;
  final String publishedAt;
  final String description;
  final String url;
  final String urlToImage;

  DateTime get date => DateTime.parse(publishedAt);

  const News({
    @required this.author,
    @required this.title,
    @required this.content,
    @required this.publishedAt,
    this.description,
    this.url,
    this.urlToImage,
  });

  static News fromJson(Map<String, dynamic> json) => News(
        author: json['author'] as String,
        title: json['title'] as String,
        content: json['content'] as String,
        publishedAt: json['publishedAt'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
      );

  static Map<String, dynamic> toJson(News news) => <String, dynamic>{
        'author': news.author,
        'title': news.title,
        'content': news.content,
        'publishedAt': news.publishedAt,
        'description': news.description,
        'url': news.url,
        'urlToImage': news.urlToImage,
      };

  @override
  String toString() => toJson(this).toString();
}
