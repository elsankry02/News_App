import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cache/cache_helper.dart';

part 'set_data_state.dart';

class SetDataCubit extends Cubit<SetDataState> {
  SetDataCubit() : super(SetDataInitial());

  Future<void> setTheme({required bool value}) async {
    await CacheData.setData(key: 'ChangeTheme', value: value);

    emit(SetDataSuccess(value));
  }

  bool? getTheme() {
    final isdata = CacheData.getData(key: 'ChangeTheme');
    return isdata;
  }
}
