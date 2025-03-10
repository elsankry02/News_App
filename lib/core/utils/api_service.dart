import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final _baseUrl = 'https://newsapi.org/v2/everything';
  final apiKey = '87f2c3d6a8dc497985d1fc2fa0841a82';
  ApiService(this._dio);

  Future<Map<String, dynamic>> newsService({required String endPoint}) async {
    final response = await _dio.get(
        '$_baseUrl?q=$endPoint&language=en&sortBy=publishedAt&apiKey=$apiKey');
    return response.data;
  }
}
