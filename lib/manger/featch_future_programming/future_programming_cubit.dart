import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/error/errors.dart';
import 'package:news_app/core/utils/api_service.dart';

import '../../models/news_models.dart';

part 'future_programming_state.dart';

class FeatchFutureProgrammingCubit extends Cubit<FeatchFutureProgrammingState> {
  FeatchFutureProgrammingCubit(this.apiService)
      : super(FeatchRecommendationInitial());

  final ApiService apiService;

  Future<void> faetchrecommendationWedgit() async {
    emit(FeatchFutureProgrammingLoading());
    try {
      var response =
          await apiService.newsService(endPoint: 'future programming');
      final List<Articles> newsModels = [];
      final data = response['articles'] as List;
      for (var news in data) {
        newsModels.add(Articles.fromJson(news));
      }
      emit(FeatchFutureProgrammingSuccess(newsModels));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(FeatchFutureProgrammingFailuer(
            ServerFailuer.fromDioException(e).toString()));
        return;
      }

      emit(FeatchFutureProgrammingFailuer(e.toString()));
    }
  }
}
