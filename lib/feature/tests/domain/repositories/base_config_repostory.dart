import 'package:testform/core/resources/data_state.dart';
import 'package:testform/feature/tests/data/models/base/base.dart';

import '../../data/models/base_config_model.dart';

abstract class BaseConfigRepository {
  Future<DataState<BaseConfigModel>> getBaseConfig(
      CommonInterface commonInterface);
}
