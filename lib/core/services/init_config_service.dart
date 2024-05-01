import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testform/feature/tests/domain/entities/init_entity.dart';

import 'base_service.dart';

part 'init_config_service.g.dart';

class InitConfigService extends BaseService {
  static const basePath = '/init';
  Future<Either<String, String>> generateInitConfig(InitEntity data) async {
    final response = await post(basePath, data: data.toJson());
    return response.fold(
      (error) => left(error),
      (result) => right(result['data']['data']),
    );
  }
}

@riverpod
InitConfigService initConfigService(InitConfigServiceRef ref) {
  return InitConfigService();
}
