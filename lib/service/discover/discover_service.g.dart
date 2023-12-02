// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$discoverServiceHash() => r'a7e158a2eb40999a103d9516e8f6bd9ffe46f55a';

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

abstract class _$DiscoverService
    extends BuildlessAsyncNotifier<List<TopHashtags>> {
  late final int arg;

  FutureOr<List<TopHashtags>> build(
    int arg,
  );
}

/// See also [DiscoverService].
@ProviderFor(DiscoverService)
const discoverServiceProvider = DiscoverServiceFamily();

/// See also [DiscoverService].
class DiscoverServiceFamily extends Family<AsyncValue<List<TopHashtags>>> {
  /// See also [DiscoverService].
  const DiscoverServiceFamily();

  /// See also [DiscoverService].
  DiscoverServiceProvider call(
    int arg,
  ) {
    return DiscoverServiceProvider(
      arg,
    );
  }

  @override
  DiscoverServiceProvider getProviderOverride(
    covariant DiscoverServiceProvider provider,
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
  String? get name => r'discoverServiceProvider';
}

/// See also [DiscoverService].
class DiscoverServiceProvider
    extends AsyncNotifierProviderImpl<DiscoverService, List<TopHashtags>> {
  /// See also [DiscoverService].
  DiscoverServiceProvider(
    int arg,
  ) : this._internal(
          () => DiscoverService()..arg = arg,
          from: discoverServiceProvider,
          name: r'discoverServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$discoverServiceHash,
          dependencies: DiscoverServiceFamily._dependencies,
          allTransitiveDependencies:
              DiscoverServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  DiscoverServiceProvider._internal(
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
  FutureOr<List<TopHashtags>> runNotifierBuild(
    covariant DiscoverService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(DiscoverService Function() create) {
    return ProviderOverride(
      origin: this,
      override: DiscoverServiceProvider._internal(
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
  AsyncNotifierProviderElement<DiscoverService, List<TopHashtags>>
      createElement() {
    return _DiscoverServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DiscoverServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DiscoverServiceRef on AsyncNotifierProviderRef<List<TopHashtags>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _DiscoverServiceProviderElement
    extends AsyncNotifierProviderElement<DiscoverService, List<TopHashtags>>
    with DiscoverServiceRef {
  _DiscoverServiceProviderElement(super.provider);

  @override
  int get arg => (origin as DiscoverServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
