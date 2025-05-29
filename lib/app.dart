import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/future_programming_page/data/future_programming_cubit/future_programming_cubit.dart';

import 'core/constants/color_manger.dart';
import 'core/router/router.dart';
import 'core/services/api_service.dart';
import 'features/home_page/data/change_theme_cubit/change_theme_cubit.dart';
import 'features/home_page/data/home_slider_cubit/home_slider_cubit.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangeThemeCubit>(
      create: (context) => ChangeThemeCubit(),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          final isDarkTheme =
              state is ChangeThemeSuccess ? state.isDark : false;

          final isThemeSaved =
              BlocProvider.of<ChangeThemeCubit>(context).getTheme();
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    HomeSliderCubit(ApiService(Dio()))..featchHomeSlider(),
              ),
              BlocProvider(
                create: (context) => FutureProgrammingCubit(ApiService(Dio()))
                  ..faetchrecommendationWedgit(),
              ),
            ],
            child: MaterialApp.router(
              routerConfig: router.config(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                scaffoldBackgroundColor: Colors.white,
                primaryColor: ColorManger.kprimaryColor,
                hintColor: ColorManger.kMaterialWhiteColor,
              ),
              themeMode: isThemeSaved ?? isDarkTheme
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Colors.black,
                primaryColor: Colors.orange,
                hintColor: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
