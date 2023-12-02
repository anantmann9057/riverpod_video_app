// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sounds_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soundsServiceHash() => r'8c446754e2168a51c1870761977a8b57a7f7a5bc';

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

abstract class _$SoundsService extends BuildlessAsyncNotifier<List<Datum>> {
  late final int arg;

  FutureOr<List<Datum>> build(
    int arg,
  );
}

/// See also [SoundsService].
@ProviderFor(SoundsService)
const soundsServiceProvider = SoundsServiceFamily();

/// See also [SoundsService].
class SoundsServiceFamily extends Family<AsyncValue<List<Datum>>> {
  /// See also [SoundsService].
  const SoundsServiceFamily();

  /// See also [SoundsService].
  SoundsServiceProvider call(
    int arg,
  ) {
    return SoundsServiceProvider(
      arg,
    );
  }

  @override
  SoundsServiceProvider getProviderOverride(
    covariant SoundsServiceProvider provider,
  ) {
    return call(
      provider.arg,
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
  String? get name => r'soundsServiceProvider';
}

/// See also [SoundsService].
class SoundsServiceProvider
    extends AsyncNotifierProviderImpl<SoundsService, List<Datum>> {
  /// See also [SoundsService].
  SoundsServiceProvider(
    int arg,
  ) : this._internal(
          () => SoundsService()..arg = arg,
          from: soundsServiceProvider,
          name: r'soundsServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$soundsServiceHash,
          dependencies: SoundsServiceFamily._dependencies,
          allTransitiveDependencies:
              SoundsServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  SoundsServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final int arg;

  @override
  FutureOr<List<Datum>> runNotifierBuild(
    covariant SoundsService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(SoundsService Function() create) {
    return ProviderOverride(
      origin: this,
      override: SoundsServiceProvider._internal(
        () => create()..arg = arg,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<SoundsService, List<Datum>> createElement() {
    return _SoundsServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SoundsServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SoundsServiceRef on AsyncNotifierProviderRef<List<Datum>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _SoundsServiceProviderElement
    extends AsyncNotifierProviderElement<SoundsService, List<Datum>>
    with SoundsServiceRef {
  _SoundsServiceProviderElement(super.provider);

  @override
  int get arg => (origin as SoundsServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
