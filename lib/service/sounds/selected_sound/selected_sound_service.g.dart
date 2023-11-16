// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_sound_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedSoundServiceHash() =>
    r'c6c28ea59f95f77995cc2b2e4776eb54573e1897';

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

abstract class _$SelectedSoundService
    extends BuildlessAutoDisposeAsyncNotifier<SelectedSoundModel> {
  late final int arg;

  FutureOr<SelectedSoundModel> build(
    int arg,
  );
}

/// See also [SelectedSoundService].
@ProviderFor(SelectedSoundService)
const selectedSoundServiceProvider = SelectedSoundServiceFamily();

/// See also [SelectedSoundService].
class SelectedSoundServiceFamily
    extends Family<AsyncValue<SelectedSoundModel>> {
  /// See also [SelectedSoundService].
  const SelectedSoundServiceFamily();

  /// See also [SelectedSoundService].
  SelectedSoundServiceProvider call(
    int arg,
  ) {
    return SelectedSoundServiceProvider(
      arg,
    );
  }

  @override
  SelectedSoundServiceProvider getProviderOverride(
    covariant SelectedSoundServiceProvider provider,
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
  String? get name => r'selectedSoundServiceProvider';
}

/// See also [SelectedSoundService].
class SelectedSoundServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SelectedSoundService, SelectedSoundModel> {
  /// See also [SelectedSoundService].
  SelectedSoundServiceProvider(
    int arg,
  ) : this._internal(
          () => SelectedSoundService()..arg = arg,
          from: selectedSoundServiceProvider,
          name: r'selectedSoundServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedSoundServiceHash,
          dependencies: SelectedSoundServiceFamily._dependencies,
          allTransitiveDependencies:
              SelectedSoundServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  SelectedSoundServiceProvider._internal(
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
  FutureOr<SelectedSoundModel> runNotifierBuild(
    covariant SelectedSoundService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(SelectedSoundService Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedSoundServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SelectedSoundService,
      SelectedSoundModel> createElement() {
    return _SelectedSoundServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedSoundServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedSoundServiceRef
    on AutoDisposeAsyncNotifierProviderRef<SelectedSoundModel> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _SelectedSoundServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SelectedSoundService,
        SelectedSoundModel> with SelectedSoundServiceRef {
  _SelectedSoundServiceProviderElement(super.provider);

  @override
  int get arg => (origin as SelectedSoundServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
