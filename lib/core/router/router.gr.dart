// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CardDetailsPage]
class CardDetailsRoute extends PageRouteInfo<CardDetailsRouteArgs> {
  CardDetailsRoute({
    Key? key,
    required Articles article,
    List<PageRouteInfo>? children,
  }) : super(
         CardDetailsRoute.name,
         args: CardDetailsRouteArgs(key: key, article: article),
         initialChildren: children,
       );

  static const String name = 'CardDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CardDetailsRouteArgs>();
      return CardDetailsPage(key: args.key, article: args.article);
    },
  );
}

class CardDetailsRouteArgs {
  const CardDetailsRouteArgs({this.key, required this.article});

  final Key? key;

  final Articles article;

  @override
  String toString() {
    return 'CardDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [CardPage]
class CardRoute extends PageRouteInfo<CardRouteArgs> {
  CardRoute({
    Key? key,
    required Articles article,
    List<PageRouteInfo>? children,
  }) : super(
         CardRoute.name,
         args: CardRouteArgs(key: key, article: article),
         initialChildren: children,
       );

  static const String name = 'CardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CardRouteArgs>();
      return CardPage(key: args.key, article: args.article);
    },
  );
}

class CardRouteArgs {
  const CardRouteArgs({this.key, required this.article});

  final Key? key;

  final Articles article;

  @override
  String toString() {
    return 'CardRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [FutureProgrammingPage]
class FutureProgrammingRoute extends PageRouteInfo<void> {
  const FutureProgrammingRoute({List<PageRouteInfo>? children})
    : super(FutureProgrammingRoute.name, initialChildren: children);

  static const String name = 'FutureProgrammingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FutureProgrammingPage();
    },
  );
}

/// generated route for
/// [GNavBarPage]
class GNavBarRoute extends PageRouteInfo<void> {
  const GNavBarRoute({List<PageRouteInfo>? children})
    : super(GNavBarRoute.name, initialChildren: children);

  static const String name = 'GNavBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GNavBarPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
