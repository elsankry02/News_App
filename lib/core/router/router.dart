import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../features/presentation/card_page/card_page.dart';

import '../../features/data/model/news_models.dart';
import '../../features/presentation/card_details_page/card_details_page.dart';
import '../../features/presentation/future_programming_page/view/future_programming_page.dart';
import '../../features/presentation/gnav_bar/gnav_bar_page.dart';
import '../../features/presentation/splash_page/splash_page.dart';

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
