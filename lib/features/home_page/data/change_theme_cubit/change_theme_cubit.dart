import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/cache_helper.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

  Future<void> setTheme({required bool value}) async {
    await CacheData.setData(key: 'ChangeTheme', value: value);

    emit(ChangeThemeSuccess(value));
  }

  bool? getTheme() {
    final isdata = CacheData.getData(key: 'ChangeTheme');
    return isdata;
  }
}
