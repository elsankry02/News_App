import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/services/api_service.dart';
import '../model/news_models.dart';

part 'home_slider_state.dart';

class HomeSliderCubit extends Cubit<HomeSliderState> {
  HomeSliderCubit(this.apiService) : super(HomeSliderInitial());
  final ApiService apiService;
  Future<void> featchHomeSlider() async {
    emit(HomeSliderLodaing());
    try {
      var result = await apiService.newsService(endPoint: 'iphone');
      List<Articles> newsList = [];
      final data = result['articles'] as List;
      for (var news in data) {
        newsList.add(
          Articles.fromJson(news),
        );
      }
      emit(
        HomeSliderSuccess(newsList),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        emit(
          HomeSliderFailuer(
            ServerFailuer.fromDioException(e).toString(),
          ),
        );
        return;
      }
      emit(
        HomeSliderFailuer(e.toString()),
      );
    }
  }
}
