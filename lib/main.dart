import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/components/color_manger.dart';
import 'package:news_app/core/router/router.dart';
import 'package:news_app/views/data/manger/featch_future_programming/future_programming_cubit.dart';
import 'package:news_app/views/data/manger/featch_home_slider/featch_home_slider_cubit.dart';
import 'package:news_app/views/data/manger/set_data/set_data_cubit.dart';

import 'cache/cache_helper.dart';
import 'core/utils/api_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetDataCubit>(
      create: (context) => SetDataCubit(),
      child: BlocBuilder<SetDataCubit, SetDataState>(
        builder: (context, state) {
          final isDarkTheme = state is SetDataSuccess ? state.isDark : false;

          final isThemeSaved = BlocProvider.of<SetDataCubit>(context).getData();
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FeatchHomeSliderCubit(
                  ApiService(
                    Dio(),
                  ),
                )..featchHomeSlider(),
              ),
              BlocProvider(
                create: (context) => FeatchFutureProgrammingCubit(
                  ApiService(
                    Dio(),
                  ),
                )..faetchrecommendationWedgit(),
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
