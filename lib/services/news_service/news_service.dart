import 'package:dio/dio.dart';

import '../../data/models/news_models.dart';

class NewsService {
  final Dio dio;
  final paseUrl = 'https://newsapi.org/v2/everything';
  final apiKey = '87f2c3d6a8dc497985d1fc2fa0841a82';
  NewsService({required this.dio});

  Future<List<Articles>> newsFunc({required String endPoint}) async {
    final response = await dio.get(
        '$paseUrl?q=$endPoint&language=en&sortBy=publishedAt&apiKey=$apiKey');
    final data = response.data as Map<String, dynamic>;
    final result = data['articles'] as List<dynamic>;
    final List<Articles> artical = [];
    for (var item in result) {
      artical.add(
        Articles.fromJson(item),
      );
    }
    return artical;
  }
}
