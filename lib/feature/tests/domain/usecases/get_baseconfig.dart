import 'package:testform/core/resources/data_state.dart';

import '../../data/models/base/base.dart';
import '../repositories/base_config_repostory.dart';

class GetBaseConfig {
  final BaseConfigRepository repository;
  final CommonInterface commonInterface;

  GetBaseConfig(this.repository, {required this.commonInterface});

  Future<DataState> call(commonInterface) {
    return repository.getBaseConfig(commonInterface);
  }
}
