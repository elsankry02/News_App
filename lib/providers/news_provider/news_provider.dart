import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/news_models.dart';
import '../providers.dart';

final globalProvider = StateProvider<String>((ref) {
  return 'Global';
});

final newsProvider = FutureProvider<List<Articles>>((ref) async {
  final service = ref.read(serviceProvider);
  final global = ref.read(globalProvider);
  return await service.newsFunc(endPoint: global);
});
