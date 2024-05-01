import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testform/feature/tests/domain/entities/init_entity.dart';
import 'package:testform/core/services/init_config_service.dart';

part 'init_config_provider.g.dart';

@riverpod
class InitConfigProvider extends _$InitConfigProvider {
  @override
  FutureOr<String> build() {
    return '';
  }

  Future<void> fetchInitConfig(InitEntity initEntity) async {
    final initConfigService = ref.read(initConfigServiceProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => initConfigService
        .generateInitConfig(initEntity)
        .then((value) => value.fold((l) => l.toString(), (r) => r)));
  }
}
