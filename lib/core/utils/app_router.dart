import 'package:go_router/go_router.dart';
import 'package:news_app/features/presentation/tabs/z_gnav_bar.dart';
import 'package:news_app/features/presentation/splash/splash_view.dart';

abstract class AppRouter {
  static const kGNavBar = '/GNavBar';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kGNavBar,
        builder: (context, state) => const GNavBar(),
      ),
    ],
  );
}
