// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoServiceHash() => r'7406bbfebf4cec23a9d228ef87faa4975dcc8d2a';

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

abstract class _$VideoService extends BuildlessAsyncNotifier<List<VideoDatum>> {
  late final int arg;

  FutureOr<List<VideoDatum>> build(
    int arg,
  );
}

/// See also [VideoService].
@ProviderFor(VideoService)
const videoServiceProvider = VideoServiceFamily();

/// See also [VideoService].
class VideoServiceFamily extends Family<AsyncValue<List<VideoDatum>>> {
  /// See also [VideoService].
  const VideoServiceFamily();

  /// See also [VideoService].
  VideoServiceProvider call(
    int arg,
  ) {
    return VideoServiceProvider(
      arg,
    );
  }

  @override
  VideoServiceProvider getProviderOverride(
    covariant VideoServiceProvider provider,
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
  String? get name => r'videoServiceProvider';
}

/// See also [VideoService].
class VideoServiceProvider
    extends AsyncNotifierProviderImpl<VideoService, List<VideoDatum>> {
  /// See also [VideoService].
  VideoServiceProvider(
    int arg,
  ) : this._internal(
          () => VideoService()..arg = arg,
          from: videoServiceProvider,
          name: r'videoServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$videoServiceHash,
          dependencies: VideoServiceFamily._dependencies,
          allTransitiveDependencies:
              VideoServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  VideoServiceProvider._internal(
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
  FutureOr<List<VideoDatum>> runNotifierBuild(
    covariant VideoService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(VideoService Function() create) {
    return ProviderOverride(
      origin: this,
      override: VideoServiceProvider._internal(
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
  AsyncNotifierProviderElement<VideoService, List<VideoDatum>> createElement() {
    return _VideoServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VideoServiceRef on AsyncNotifierProviderRef<List<VideoDatum>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _VideoServiceProviderElement
    extends AsyncNotifierProviderElement<VideoService, List<VideoDatum>>
    with VideoServiceRef {
  _VideoServiceProviderElement(super.provider);

  @override
  int get arg => (origin as VideoServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
