import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/error/errors.dart';
import 'package:news_app/core/utils/api_service.dart';

import '../../models/news_models.dart';

part 'featch_home_slider_state.dart';

class FeatchHomeSliderCubit extends Cubit<FeatchHomeSliderState> {
  FeatchHomeSliderCubit(this.apiService) : super(FeatchHomeSliderInitial());
  final ApiService apiService;
  Future<void> featchHomeSlider() async {
    emit(FeatchHomeSliderLodaing());
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
        FeatchHomeSliderSuccess(newsList),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        emit(
          FeatchHomeSliderFailuer(
            ServerFailuer.fromDioException(e).toString(),
          ),
        );
        return;
      }
      emit(
        FeatchHomeSliderFailuer(e.toString()),
      );
    }
  }
}
