// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashtag_videos_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hashtagVideosServiceHash() =>
    r'5486c037cb5deb7483cbf701ff415c0984c10ae8';

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

abstract class _$HashtagVideosService
    extends BuildlessAutoDisposeAsyncNotifier<HashtagVideosModel> {
  late final int arg;

  FutureOr<HashtagVideosModel> build(
    int arg,
  );
}

/// See also [HashtagVideosService].
@ProviderFor(HashtagVideosService)
const hashtagVideosServiceProvider = HashtagVideosServiceFamily();

/// See also [HashtagVideosService].
class HashtagVideosServiceFamily
    extends Family<AsyncValue<HashtagVideosModel>> {
  /// See also [HashtagVideosService].
  const HashtagVideosServiceFamily();

  /// See also [HashtagVideosService].
  HashtagVideosServiceProvider call(
    int arg,
  ) {
    return HashtagVideosServiceProvider(
      arg,
    );
  }

  @override
  HashtagVideosServiceProvider getProviderOverride(
    covariant HashtagVideosServiceProvider provider,
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
  String? get name => r'hashtagVideosServiceProvider';
}

/// See also [HashtagVideosService].
class HashtagVideosServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    HashtagVideosService, HashtagVideosModel> {
  /// See also [HashtagVideosService].
  HashtagVideosServiceProvider(
    int arg,
  ) : this._internal(
          () => HashtagVideosService()..arg = arg,
          from: hashtagVideosServiceProvider,
          name: r'hashtagVideosServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hashtagVideosServiceHash,
          dependencies: HashtagVideosServiceFamily._dependencies,
          allTransitiveDependencies:
              HashtagVideosServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  HashtagVideosServiceProvider._internal(
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
  FutureOr<HashtagVideosModel> runNotifierBuild(
    covariant HashtagVideosService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(HashtagVideosService Function() create) {
    return ProviderOverride(
      origin: this,
      override: HashtagVideosServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<HashtagVideosService,
      HashtagVideosModel> createElement() {
    return _HashtagVideosServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HashtagVideosServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HashtagVideosServiceRef
    on AutoDisposeAsyncNotifierProviderRef<HashtagVideosModel> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _HashtagVideosServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<HashtagVideosService,
        HashtagVideosModel> with HashtagVideosServiceRef {
  _HashtagVideosServiceProviderElement(super.provider);

  @override
  int get arg => (origin as HashtagVideosServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
