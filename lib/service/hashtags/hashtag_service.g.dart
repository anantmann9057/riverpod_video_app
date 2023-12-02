// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashtag_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hashtagServiceHash() => r'a3a3e31fa0a2f6205e281dfaf51df7747f70cc03';

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

abstract class _$HashtagService
    extends BuildlessAsyncNotifier<List<HashtagList>> {
  late final int arg;

  FutureOr<List<HashtagList>> build(
    int arg,
  );
}

/// See also [HashtagService].
@ProviderFor(HashtagService)
const hashtagServiceProvider = HashtagServiceFamily();

/// See also [HashtagService].
class HashtagServiceFamily extends Family<AsyncValue<List<HashtagList>>> {
  /// See also [HashtagService].
  const HashtagServiceFamily();

  /// See also [HashtagService].
  HashtagServiceProvider call(
    int arg,
  ) {
    return HashtagServiceProvider(
      arg,
    );
  }

  @override
  HashtagServiceProvider getProviderOverride(
    covariant HashtagServiceProvider provider,
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
  String? get name => r'hashtagServiceProvider';
}

/// See also [HashtagService].
class HashtagServiceProvider
    extends AsyncNotifierProviderImpl<HashtagService, List<HashtagList>> {
  /// See also [HashtagService].
  HashtagServiceProvider(
    int arg,
  ) : this._internal(
          () => HashtagService()..arg = arg,
          from: hashtagServiceProvider,
          name: r'hashtagServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hashtagServiceHash,
          dependencies: HashtagServiceFamily._dependencies,
          allTransitiveDependencies:
              HashtagServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  HashtagServiceProvider._internal(
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
  FutureOr<List<HashtagList>> runNotifierBuild(
    covariant HashtagService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(HashtagService Function() create) {
    return ProviderOverride(
      origin: this,
      override: HashtagServiceProvider._internal(
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
  AsyncNotifierProviderElement<HashtagService, List<HashtagList>>
      createElement() {
    return _HashtagServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HashtagServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HashtagServiceRef on AsyncNotifierProviderRef<List<HashtagList>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _HashtagServiceProviderElement
    extends AsyncNotifierProviderElement<HashtagService, List<HashtagList>>
    with HashtagServiceRef {
  _HashtagServiceProviderElement(super.provider);

  @override
  int get arg => (origin as HashtagServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
