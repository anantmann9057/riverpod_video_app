// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentsServiceHash() => r'fb32ec0ab7c393cca10f1e894435940783ca4e2c';

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

abstract class _$CommentsService
    extends BuildlessAutoDisposeAsyncNotifier<CommentsModel> {
  late final int arg;

  FutureOr<CommentsModel> build(
    int arg,
  );
}

/// See also [CommentsService].
@ProviderFor(CommentsService)
const commentsServiceProvider = CommentsServiceFamily();

/// See also [CommentsService].
class CommentsServiceFamily extends Family<AsyncValue<CommentsModel>> {
  /// See also [CommentsService].
  const CommentsServiceFamily();

  /// See also [CommentsService].
  CommentsServiceProvider call(
    int arg,
  ) {
    return CommentsServiceProvider(
      arg,
    );
  }

  @override
  CommentsServiceProvider getProviderOverride(
    covariant CommentsServiceProvider provider,
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
  String? get name => r'commentsServiceProvider';
}

/// See also [CommentsService].
class CommentsServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CommentsService, CommentsModel> {
  /// See also [CommentsService].
  CommentsServiceProvider(
    int arg,
  ) : this._internal(
          () => CommentsService()..arg = arg,
          from: commentsServiceProvider,
          name: r'commentsServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentsServiceHash,
          dependencies: CommentsServiceFamily._dependencies,
          allTransitiveDependencies:
              CommentsServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  CommentsServiceProvider._internal(
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
  FutureOr<CommentsModel> runNotifierBuild(
    covariant CommentsService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(CommentsService Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommentsServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CommentsService, CommentsModel>
      createElement() {
    return _CommentsServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentsServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommentsServiceRef on AutoDisposeAsyncNotifierProviderRef<CommentsModel> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _CommentsServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CommentsService,
        CommentsModel> with CommentsServiceRef {
  _CommentsServiceProviderElement(super.provider);

  @override
  int get arg => (origin as CommentsServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
