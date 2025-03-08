import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/data/models/news_models.dart';
import 'package:news_app/views/pages/card_details/card_details_page.dart';
import 'package:news_app/views/pages/future_programming/future_programming_page.dart';
import 'package:news_app/views/pages/gnav_bar/gnav_bar_page.dart';
import 'package:news_app/views/pages/splash/splash_page.dart';

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
      ];
}
