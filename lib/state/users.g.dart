// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchHomePageDataHash() => r'f9a651ba982742af2e85e4be126e27f0aed5b99a';

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

/// See also [fetchHomePageData].
@ProviderFor(fetchHomePageData)
const fetchHomePageDataProvider = FetchHomePageDataFamily();

/// See also [fetchHomePageData].
class FetchHomePageDataFamily extends Family<AsyncValue<ProfileData>> {
  /// See also [fetchHomePageData].
  const FetchHomePageDataFamily();

  /// See also [fetchHomePageData].
  FetchHomePageDataProvider call(
    String id,
    WidgetRef refP,
  ) {
    return FetchHomePageDataProvider(
      id,
      refP,
    );
  }

  @override
  FetchHomePageDataProvider getProviderOverride(
    covariant FetchHomePageDataProvider provider,
  ) {
    return call(
      provider.id,
      provider.refP,
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
  String? get name => r'fetchHomePageDataProvider';
}

/// See also [fetchHomePageData].
class FetchHomePageDataProvider extends AutoDisposeFutureProvider<ProfileData> {
  /// See also [fetchHomePageData].
  FetchHomePageDataProvider(
    String id,
    WidgetRef refP,
  ) : this._internal(
          (ref) => fetchHomePageData(
            ref as FetchHomePageDataRef,
            id,
            refP,
          ),
          from: fetchHomePageDataProvider,
          name: r'fetchHomePageDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchHomePageDataHash,
          dependencies: FetchHomePageDataFamily._dependencies,
          allTransitiveDependencies:
              FetchHomePageDataFamily._allTransitiveDependencies,
          id: id,
          refP: refP,
        );

  FetchHomePageDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.refP,
  }) : super.internal();

  final String id;
  final WidgetRef refP;

  @override
  Override overrideWith(
    FutureOr<ProfileData> Function(FetchHomePageDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchHomePageDataProvider._internal(
        (ref) => create(ref as FetchHomePageDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        refP: refP,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProfileData> createElement() {
    return _FetchHomePageDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchHomePageDataProvider &&
        other.id == id &&
        other.refP == refP;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, refP.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchHomePageDataRef on AutoDisposeFutureProviderRef<ProfileData> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `refP` of this provider.
  WidgetRef get refP;
}

class _FetchHomePageDataProviderElement
    extends AutoDisposeFutureProviderElement<ProfileData>
    with FetchHomePageDataRef {
  _FetchHomePageDataProviderElement(super.provider);

  @override
  String get id => (origin as FetchHomePageDataProvider).id;
  @override
  WidgetRef get refP => (origin as FetchHomePageDataProvider).refP;
}

String _$fetchUserHash() => r'68c35d95ac51f190d0cd2924bf9f38df9ae38e10';

/// See also [fetchUser].
@ProviderFor(fetchUser)
const fetchUserProvider = FetchUserFamily();

/// See also [fetchUser].
class FetchUserFamily extends Family<AsyncValue<ProfileData?>> {
  /// See also [fetchUser].
  const FetchUserFamily();

  /// See also [fetchUser].
  FetchUserProvider call(
    String id,
  ) {
    return FetchUserProvider(
      id,
    );
  }

  @override
  FetchUserProvider getProviderOverride(
    covariant FetchUserProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'fetchUserProvider';
}

/// See also [fetchUser].
class FetchUserProvider extends AutoDisposeFutureProvider<ProfileData?> {
  /// See also [fetchUser].
  FetchUserProvider(
    String id,
  ) : this._internal(
          (ref) => fetchUser(
            ref as FetchUserRef,
            id,
          ),
          from: fetchUserProvider,
          name: r'fetchUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserHash,
          dependencies: FetchUserFamily._dependencies,
          allTransitiveDependencies: FetchUserFamily._allTransitiveDependencies,
          id: id,
        );

  FetchUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ProfileData?> Function(FetchUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserProvider._internal(
        (ref) => create(ref as FetchUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProfileData?> createElement() {
    return _FetchUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserRef on AutoDisposeFutureProviderRef<ProfileData?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchUserProviderElement
    extends AutoDisposeFutureProviderElement<ProfileData?> with FetchUserRef {
  _FetchUserProviderElement(super.provider);

  @override
  String get id => (origin as FetchUserProvider).id;
}

String _$fetchUserStatusHash() => r'9be6919463f83d6318e55d44f6273cb89b986575';

/// See also [fetchUserStatus].
@ProviderFor(fetchUserStatus)
const fetchUserStatusProvider = FetchUserStatusFamily();

/// See also [fetchUserStatus].
class FetchUserStatusFamily extends Family<AsyncValue<UsersStatusData>> {
  /// See also [fetchUserStatus].
  const FetchUserStatusFamily();

  /// See also [fetchUserStatus].
  FetchUserStatusProvider call(
    String id,
  ) {
    return FetchUserStatusProvider(
      id,
    );
  }

  @override
  FetchUserStatusProvider getProviderOverride(
    covariant FetchUserStatusProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'fetchUserStatusProvider';
}

/// See also [fetchUserStatus].
class FetchUserStatusProvider
    extends AutoDisposeFutureProvider<UsersStatusData> {
  /// See also [fetchUserStatus].
  FetchUserStatusProvider(
    String id,
  ) : this._internal(
          (ref) => fetchUserStatus(
            ref as FetchUserStatusRef,
            id,
          ),
          from: fetchUserStatusProvider,
          name: r'fetchUserStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserStatusHash,
          dependencies: FetchUserStatusFamily._dependencies,
          allTransitiveDependencies:
              FetchUserStatusFamily._allTransitiveDependencies,
          id: id,
        );

  FetchUserStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<UsersStatusData> Function(FetchUserStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserStatusProvider._internal(
        (ref) => create(ref as FetchUserStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UsersStatusData> createElement() {
    return _FetchUserStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserStatusProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserStatusRef on AutoDisposeFutureProviderRef<UsersStatusData> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchUserStatusProviderElement
    extends AutoDisposeFutureProviderElement<UsersStatusData>
    with FetchUserStatusRef {
  _FetchUserStatusProviderElement(super.provider);

  @override
  String get id => (origin as FetchUserStatusProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
