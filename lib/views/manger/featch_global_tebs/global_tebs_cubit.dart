import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/error/errors.dart';
import 'package:news_app/core/utils/api_service.dart';

import '../../../models/news_models.dart';
part 'global_tebs_state.dart';

class FeatchGlobalTebsCubit extends Cubit<FeatchGlobalTebsState> {
  final ApiService apiService;
  FeatchGlobalTebsCubit(this.apiService) : super(FeatchGlobalTebsInitial());

  Future<void> featchGlobalTebs() async {
    emit(FeatchGlobalTebsLoading());
    try {
      final result = await apiService.newsService(endPoint: 'sport');
      List<Articles> newsList = [];
      final data = result["articles"] as List;

      for (var news in data) {
        newsList.add(Articles.fromJson(news));
      }
      emit(FeatchGlobalTebsSuccsses(newsList));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(
          FeatchGlobalTebsFaliuer(ServerFailuer.fromDioException(e).toString()),
        );
        return;
      }
      emit(
        FeatchGlobalTebsFaliuer(
          e.toString(),
        ),
      );
    }
  }
}
