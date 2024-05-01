import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testform/core/resources/data_state.dart';
import 'package:testform/feature/tests/data/models/base/base.dart';
import 'package:testform/feature/tests/data/repositories/base_config_repository_impl.dart';

import '../../data/models/base_config_model.dart';
import '../../domain/usecases/get_baseconfig.dart';

class BaseConfigProvider extends AsyncNotifier<BaseConfigModel> {
  final GetBaseConfig _getBaseConfig;
  final CommonInterface commonInterface;

  BaseConfigProvider(this._getBaseConfig, this.commonInterface);

  @override
  FutureOr<BaseConfigModel> build() async {
    final commonInterface = this.commonInterface;
    final result = await _getBaseConfig(commonInterface);
    if (result is DataSuccess && result.data!.isNotEmpty) {
      return result.data!;
    }
    if (result is DataException) {
      debugPrint('errors');
      return const BaseConfigModel(
        errorCode: 0,
        message: '',
        data: '',
      );
    }

    throw Exception('Unknown error');
  }

  Future<void> loadBaseConfig(CommonInterface commonInterface) async {
    final result = await _getBaseConfig(commonInterface);

    if (result is DataSuccess && result.data!.isNotEmpty) {
      state = result.data!;
    }
    if (result is DataException) {
      debugPrint('errors');
    }
  }
}

// Post data state management
final sentDataProvider = StateProvider<CommonInterface>((ref) {
  CommonInterface commonInterface =
      const CommonInterface(apPort: [], basePort: []);
  return commonInterface;
});

final receiveDataProvider =
    FutureProvider.autoDispose<BaseConfigModel>((ref) async {
  final repository = ref.read(baseConfigRepositoryImplProvider);
  final sentData = ref.watch(sentDataProvider.notifier);

  final result = await repository.getBaseConfig(sentData.state);
  if (result is DataSuccess) {
    return result.data!;
  }
  if (result is DataException) {
    debugPrint('errors');
    return const BaseConfigModel(
      errorCode: 0,
      message: '',
      data: '',
    );
  }

  throw Exception('Unknown error');
});
