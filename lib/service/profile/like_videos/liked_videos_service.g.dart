// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_videos_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likedVideosServiceHash() =>
    r'7a24a9eed590b40aa6fdf6a783796546d4b3e30a';

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

abstract class _$LikedVideosService
    extends BuildlessAutoDisposeAsyncNotifier<List<UserVideos>> {
  late final int arg;

  FutureOr<List<UserVideos>> build(
    int arg,
  );
}

/// See also [LikedVideosService].
@ProviderFor(LikedVideosService)
const likedVideosServiceProvider = LikedVideosServiceFamily();

/// See also [LikedVideosService].
class LikedVideosServiceFamily extends Family<AsyncValue<List<UserVideos>>> {
  /// See also [LikedVideosService].
  const LikedVideosServiceFamily();

  /// See also [LikedVideosService].
  LikedVideosServiceProvider call(
    int arg,
  ) {
    return LikedVideosServiceProvider(
      arg,
    );
  }

  @override
  LikedVideosServiceProvider getProviderOverride(
    covariant LikedVideosServiceProvider provider,
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
  String? get name => r'likedVideosServiceProvider';
}

/// See also [LikedVideosService].
class LikedVideosServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LikedVideosService, List<UserVideos>> {
  /// See also [LikedVideosService].
  LikedVideosServiceProvider(
    int arg,
  ) : this._internal(
          () => LikedVideosService()..arg = arg,
          from: likedVideosServiceProvider,
          name: r'likedVideosServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likedVideosServiceHash,
          dependencies: LikedVideosServiceFamily._dependencies,
          allTransitiveDependencies:
              LikedVideosServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  LikedVideosServiceProvider._internal(
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
    covariant LikedVideosService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(LikedVideosService Function() create) {
    return ProviderOverride(
      origin: this,
      override: LikedVideosServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LikedVideosService, List<UserVideos>>
      createElement() {
    return _LikedVideosServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikedVideosServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LikedVideosServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<UserVideos>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _LikedVideosServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LikedVideosService,
        List<UserVideos>> with LikedVideosServiceRef {
  _LikedVideosServiceProviderElement(super.provider);

  @override
  int get arg => (origin as LikedVideosServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
