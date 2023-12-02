// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likesServiceHash() => r'c7e97359bf7e86e6c72cfbd203ff172db01319a1';

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

abstract class _$LikesService
    extends BuildlessAutoDisposeAsyncNotifier<VideoLikesModel> {
  late final int arg;

  FutureOr<VideoLikesModel> build(
    int arg,
  );
}

/// See also [LikesService].
@ProviderFor(LikesService)
const likesServiceProvider = LikesServiceFamily();

/// See also [LikesService].
class LikesServiceFamily extends Family<AsyncValue<VideoLikesModel>> {
  /// See also [LikesService].
  const LikesServiceFamily();

  /// See also [LikesService].
  LikesServiceProvider call(
    int arg,
  ) {
    return LikesServiceProvider(
      arg,
    );
  }

  @override
  LikesServiceProvider getProviderOverride(
    covariant LikesServiceProvider provider,
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
  String? get name => r'likesServiceProvider';
}

/// See also [LikesService].
class LikesServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LikesService, VideoLikesModel> {
  /// See also [LikesService].
  LikesServiceProvider(
    int arg,
  ) : this._internal(
          () => LikesService()..arg = arg,
          from: likesServiceProvider,
          name: r'likesServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likesServiceHash,
          dependencies: LikesServiceFamily._dependencies,
          allTransitiveDependencies:
              LikesServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  LikesServiceProvider._internal(
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
  FutureOr<VideoLikesModel> runNotifierBuild(
    covariant LikesService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(LikesService Function() create) {
    return ProviderOverride(
      origin: this,
      override: LikesServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LikesService, VideoLikesModel>
      createElement() {
    return _LikesServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikesServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LikesServiceRef on AutoDisposeAsyncNotifierProviderRef<VideoLikesModel> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _LikesServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LikesService,
        VideoLikesModel> with LikesServiceRef {
  _LikesServiceProviderElement(super.provider);

  @override
  int get arg => (origin as LikesServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
