import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/error/errors.dart';
import '../../../core/utils/api_service.dart';

import '../../models/news_models.dart';

part 'featch_search_tabs_state.dart';

class FetchSearchTebsCubit extends Cubit<FetchSearchTebsState> {
  FetchSearchTebsCubit(this.apiService) : super(FetchSearchTebsInitial());
  final ApiService apiService;

  Future<void> fetchSearch({required String category}) async {
    emit(FetchSearchTebsLoading());
    try {
      var result = await apiService.newsService(endPoint: category);
      List<Articles> newsList = [];
      final data = result['articles'] as List;
      for (var news in data) {
        newsList.add(Articles.fromJson(news));
      }
      emit(
        FetchSearchTebsSuccess(newsList),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        emit(
          FetchSearchTebsFailuer(
            ServerFailuer.fromDioException(e).toString(),
          ),
        );
        return;
      }
      emit(
        FetchSearchTebsFailuer(e.toString()),
      );
    }
  }
}
