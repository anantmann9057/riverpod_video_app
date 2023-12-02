// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_videos_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$privateVideosServiceHash() =>
    r'a2ad47ebea04629d8af1fd3e79f06505afb08b12';

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

abstract class _$PrivateVideosService
    extends BuildlessAutoDisposeAsyncNotifier<List<UserVideos>> {
  late final int arg;

  FutureOr<List<UserVideos>> build(
    int arg,
  );
}

/// See also [PrivateVideosService].
@ProviderFor(PrivateVideosService)
const privateVideosServiceProvider = PrivateVideosServiceFamily();

/// See also [PrivateVideosService].
class PrivateVideosServiceFamily extends Family<AsyncValue<List<UserVideos>>> {
  /// See also [PrivateVideosService].
  const PrivateVideosServiceFamily();

  /// See also [PrivateVideosService].
  PrivateVideosServiceProvider call(
    int arg,
  ) {
    return PrivateVideosServiceProvider(
      arg,
    );
  }

  @override
  PrivateVideosServiceProvider getProviderOverride(
    covariant PrivateVideosServiceProvider provider,
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
  String? get name => r'privateVideosServiceProvider';
}

/// See also [PrivateVideosService].
class PrivateVideosServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PrivateVideosService, List<UserVideos>> {
  /// See also [PrivateVideosService].
  PrivateVideosServiceProvider(
    int arg,
  ) : this._internal(
          () => PrivateVideosService()..arg = arg,
          from: privateVideosServiceProvider,
          name: r'privateVideosServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$privateVideosServiceHash,
          dependencies: PrivateVideosServiceFamily._dependencies,
          allTransitiveDependencies:
              PrivateVideosServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  PrivateVideosServiceProvider._internal(
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
  FutureOr<List<UserVideos>> runNotifierBuild(
    covariant PrivateVideosService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(PrivateVideosService Function() create) {
    return ProviderOverride(
      origin: this,
      override: PrivateVideosServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PrivateVideosService,
      List<UserVideos>> createElement() {
    return _PrivateVideosServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PrivateVideosServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PrivateVideosServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<UserVideos>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _PrivateVideosServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PrivateVideosService,
        List<UserVideos>> with PrivateVideosServiceRef {
  _PrivateVideosServiceProviderElement(super.provider);

  @override
  int get arg => (origin as PrivateVideosServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
