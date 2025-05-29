import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/card_page/presentation/view/card_page.dart';

import '../../features/home_page/data/model/news_models.dart';
import '../../features/card_details_page/presentation/view/card_details_page.dart';
import '../../features/future_programming_page/presentation/view/future_programming_page.dart';
import '../../features/gnav_bar/presentation/view/gnav_bar_page.dart';
import '../../features/splash_page/presentation/view/splash_page.dart';

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
