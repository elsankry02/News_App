import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/color_manger.dart';
import 'router/router.dart';
import 'services/api_service.dart';
import 'data/bloc/featch_future_programming/future_programming_cubit.dart';
import 'data/bloc/featch_home_slider/featch_home_slider_cubit.dart';
import 'data/bloc/set_data/set_data_cubit.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetDataCubit>(
      create: (context) => SetDataCubit(),
      child: BlocBuilder<SetDataCubit, SetDataState>(
        builder: (context, state) {
          final isDarkTheme = state is SetDataSuccess ? state.isDark : false;

          final isThemeSaved =
              BlocProvider.of<SetDataCubit>(context).getTheme();
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
