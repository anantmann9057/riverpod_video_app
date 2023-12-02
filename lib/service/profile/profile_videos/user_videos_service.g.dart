// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_videos_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userVideosServiceHash() => r'6f48cb01762c3fd32deb133c663d27a6acf6cc77';

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

abstract class _$UserVideosService
    extends BuildlessAsyncNotifier<List<UserVideos>> {
  late final int arg;

  FutureOr<List<UserVideos>> build(
    int arg,
  );
}

/// See also [UserVideosService].
@ProviderFor(UserVideosService)
const userVideosServiceProvider = UserVideosServiceFamily();

/// See also [UserVideosService].
class UserVideosServiceFamily extends Family<AsyncValue<List<UserVideos>>> {
  /// See also [UserVideosService].
  const UserVideosServiceFamily();

  /// See also [UserVideosService].
  UserVideosServiceProvider call(
    int arg,
  ) {
    return UserVideosServiceProvider(
      arg,
    );
  }

  @override
  UserVideosServiceProvider getProviderOverride(
    covariant UserVideosServiceProvider provider,
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
  String? get name => r'userVideosServiceProvider';
}

/// See also [UserVideosService].
class UserVideosServiceProvider
    extends AsyncNotifierProviderImpl<UserVideosService, List<UserVideos>> {
  /// See also [UserVideosService].
  UserVideosServiceProvider(
    int arg,
  ) : this._internal(
          () => UserVideosService()..arg = arg,
          from: userVideosServiceProvider,
          name: r'userVideosServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userVideosServiceHash,
          dependencies: UserVideosServiceFamily._dependencies,
          allTransitiveDependencies:
              UserVideosServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  UserVideosServiceProvider._internal(
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
    covariant UserVideosService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(UserVideosService Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserVideosServiceProvider._internal(
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
  AsyncNotifierProviderElement<UserVideosService, List<UserVideos>>
      createElement() {
    return _UserVideosServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserVideosServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserVideosServiceRef on AsyncNotifierProviderRef<List<UserVideos>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _UserVideosServiceProviderElement
    extends AsyncNotifierProviderElement<UserVideosService, List<UserVideos>>
    with UserVideosServiceRef {
  _UserVideosServiceProviderElement(super.provider);

  @override
  int get arg => (origin as UserVideosServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
