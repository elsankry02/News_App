import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/services/api_service.dart';
import '../../model/news_models.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.apiService) : super(SearchInitial());
  final ApiService apiService;

  Future<void> fetchSearch({required String category}) async {
    emit(SearchLoading());
    try {
      var result = await apiService.newsService(endPoint: category);
      List<Articles> newsList = [];
      final data = result['articles'] as List;
      for (var news in data) {
        newsList.add(Articles.fromJson(news));
      }
      emit(
        SearchSuccess(newsList),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        emit(
          SearchFailuer(
            ServerFailuer.fromDioException(e).toString(),
          ),
        );
        return;
      }
      emit(
        SearchFailuer(e.toString()),
      );
    }
  }
}
