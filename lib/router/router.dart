import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/card_page/card_page.dart';

import '../data/models/news_models.dart';
import '../views/card_details_page/card_details_page.dart';
import '../views/future_programming_page/future_programming_page.dart';
import '../views/gnav_bar/gnav_bar_page.dart';
import '../views/splash_page/splash_page.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: CardDetailsRoute.page),
        AutoRoute(page: FutureProgrammingRoute.page),
        AutoRoute(page: GNavBarRoute.page),
        AutoRoute(page: CardRoute.page),
      ];
}
