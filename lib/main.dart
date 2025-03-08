import 'package:flutter/material.dart';
import 'app.dart';

import 'cache/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  runApp(const NewsApp());
}
