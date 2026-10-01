import 'package:news_app/models/news_model.dart';

class NewsResponse {
  final int status;
  final String message;
  final NewsModel breakingNews;
  final List<NewsModel> data;

  NewsResponse({
    required this.status,
    required this.message,
    required this.breakingNews,
    required this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      message: json['message'],
      breakingNews: NewsModel.fromJson(json['breaking_news']),
      data: (json['data'] as List)
          .map((item) => NewsModel.fromJson(item))
          .toList(),
    );
  }
}
