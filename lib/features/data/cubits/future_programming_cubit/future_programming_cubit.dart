import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/errors.dart';
import '../../../../core/services/api_service.dart';
import '../../model/news_models.dart';

part 'future_programming_state.dart';

class FutureProgrammingCubit extends Cubit<FutureProgrammingState> {
  FutureProgrammingCubit(this.apiService) : super(FutureProgrammingInitial());

  final ApiService apiService;

  Future<void> faetchrecommendationWedgit() async {
    emit(FutureProgrammingLoading());
    try {
      var response =
          await apiService.newsService(endPoint: 'future programming');
      final List<Articles> newsModels = [];
      final data = response['articles'] as List;
      for (var news in data) {
        newsModels.add(Articles.fromJson(news));
      }
      emit(FutureProgrammingSuccess(newsModels));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(FutureProgrammingFailuer(
            ServerFailuer.fromDioException(e).toString()));
        return;
      }

      emit(FutureProgrammingFailuer(e.toString()));
    }
  }
}
