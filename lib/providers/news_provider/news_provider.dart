import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/news_models.dart';
import 'package:news_app/providers/providers.dart';

final endPointProvider = StateProvider<String>((ref) {
  return '';
});

final newsProvider = FutureProvider<List<Articles>>((ref) async {
  final service = ref.read(serviceProvider);
  final endPoint = ref.watch(endPointProvider);
  return await service.newsFunc(endPoint: endPoint);
});
