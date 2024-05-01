// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_config_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$baseConfigRepositoryImplHash() =>
    r'f97598d78c2cae2818a3d07d18f9743a884de4b0';

/// See also [baseConfigRepositoryImpl].
@ProviderFor(baseConfigRepositoryImpl)
final baseConfigRepositoryImplProvider =
    AutoDisposeProvider<BaseConfigRepositoryImpl>.internal(
  baseConfigRepositoryImpl,
  name: r'baseConfigRepositoryImplProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$baseConfigRepositoryImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BaseConfigRepositoryImplRef
    = AutoDisposeProviderRef<BaseConfigRepositoryImpl>;
String _$getBaseConfigHash() => r'08944f3756890ca65ce94c2f04b58fa53e81cf19';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getBaseConfig].
@ProviderFor(getBaseConfig)
const getBaseConfigProvider = GetBaseConfigFamily();

/// See also [getBaseConfig].
class GetBaseConfigFamily
    extends Family<AsyncValue<DataState<BaseConfigModel>>> {
  /// See also [getBaseConfig].
  const GetBaseConfigFamily();

  /// See also [getBaseConfig].
  GetBaseConfigProvider call(
    CommonInterface commonInterface,
  ) {
    return GetBaseConfigProvider(
      commonInterface,
    );
  }

  @override
  GetBaseConfigProvider getProviderOverride(
    covariant GetBaseConfigProvider provider,
  ) {
    return call(
      provider.commonInterface,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getBaseConfigProvider';
}

/// See also [getBaseConfig].
class GetBaseConfigProvider
    extends AutoDisposeFutureProvider<DataState<BaseConfigModel>> {
  /// See also [getBaseConfig].
  GetBaseConfigProvider(
    CommonInterface commonInterface,
  ) : this._internal(
          (ref) => getBaseConfig(
            ref as GetBaseConfigRef,
            commonInterface,
          ),
          from: getBaseConfigProvider,
          name: r'getBaseConfigProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBaseConfigHash,
          dependencies: GetBaseConfigFamily._dependencies,
          allTransitiveDependencies:
              GetBaseConfigFamily._allTransitiveDependencies,
          commonInterface: commonInterface,
        );

  GetBaseConfigProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commonInterface,
  }) : super.internal();

  final CommonInterface commonInterface;

  @override
  Override overrideWith(
    FutureOr<DataState<BaseConfigModel>> Function(GetBaseConfigRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBaseConfigProvider._internal(
        (ref) => create(ref as GetBaseConfigRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commonInterface: commonInterface,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DataState<BaseConfigModel>> createElement() {
    return _GetBaseConfigProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBaseConfigProvider &&
        other.commonInterface == commonInterface;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commonInterface.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetBaseConfigRef
    on AutoDisposeFutureProviderRef<DataState<BaseConfigModel>> {
  /// The parameter `commonInterface` of this provider.
  CommonInterface get commonInterface;
}

class _GetBaseConfigProviderElement
    extends AutoDisposeFutureProviderElement<DataState<BaseConfigModel>>
    with GetBaseConfigRef {
  _GetBaseConfigProviderElement(super.provider);

  @override
  CommonInterface get commonInterface =>
      (origin as GetBaseConfigProvider).commonInterface;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
