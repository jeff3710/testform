import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testform/core/resources/data_state.dart';
import 'package:testform/feature/tests/domain/repositories/base_config_repostory.dart';

import '../models/base/base.dart';
import '../data_sources/remote/data_source_remote.dart';
import '../models/base_config_model.dart';
part 'base_config_repository_impl.g.dart';

class BaseConfigRepositoryImpl implements BaseConfigRepository {
  final BaseConfigApiService _configService;

  BaseConfigRepositoryImpl(this._configService);

  @override
  Future<DataState<BaseConfigModel>> getBaseConfig(commonInterface) async {
    try {
      final httpResponse = await _configService.getBaseConfig(
        commonInterface,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }
}

@riverpod
BaseConfigRepositoryImpl baseConfigRepositoryImpl(
    BaseConfigRepositoryImplRef ref) {
  // final dio = Dio();
  // final baseConfigApiService = BaseConfigApiService(dio);
  return BaseConfigRepositoryImpl(BaseConfigApiService(Dio()));
}

@riverpod
Future<DataState<BaseConfigModel>> getBaseConfig(
    GetBaseConfigRef ref, CommonInterface commonInterface) {
  return ref
      .watch(baseConfigRepositoryImplProvider)
      .getBaseConfig(commonInterface);
}
