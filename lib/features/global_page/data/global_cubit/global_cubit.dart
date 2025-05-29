import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/services/api_service.dart';
import '../../../home_page/data/model/news_models.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  final ApiService apiService;
  GlobalCubit(this.apiService) : super(GlobalInitial());

  Future<void> featchGlobalTebs() async {
    emit(GlobalLoading());
    try {
      final result = await apiService.newsService(endPoint: 'sport');
      List<Articles> newsList = [];
      final data = result["articles"] as List;

      for (var news in data) {
        newsList.add(Articles.fromJson(news));
      }
      emit(GlobalSuccsses(newsList));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(
          GlobalFaliuer(ServerFailuer.fromDioException(e).toString()),
        );
        return;
      }
      emit(
        GlobalFaliuer(
          e.toString(),
        ),
      );
    }
  }
}
