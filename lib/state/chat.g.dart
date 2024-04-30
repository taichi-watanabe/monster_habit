// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMessageDataHash() => r'76d11c182e11007897a763d82204abfd51aef0db';

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

/// See also [getMessageData].
@ProviderFor(getMessageData)
const getMessageDataProvider = GetMessageDataFamily();

/// See also [getMessageData].
class GetMessageDataFamily extends Family<AsyncValue<List<MessageData>>> {
  /// See also [getMessageData].
  const GetMessageDataFamily();

  /// See also [getMessageData].
  GetMessageDataProvider call(
    String id,
  ) {
    return GetMessageDataProvider(
      id,
    );
  }

  @override
  GetMessageDataProvider getProviderOverride(
    covariant GetMessageDataProvider provider,
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
  String? get name => r'getMessageDataProvider';
}

/// See also [getMessageData].
class GetMessageDataProvider
    extends AutoDisposeStreamProvider<List<MessageData>> {
  /// See also [getMessageData].
  GetMessageDataProvider(
    String id,
  ) : this._internal(
          (ref) => getMessageData(
            ref as GetMessageDataRef,
            id,
          ),
          from: getMessageDataProvider,
          name: r'getMessageDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMessageDataHash,
          dependencies: GetMessageDataFamily._dependencies,
          allTransitiveDependencies:
              GetMessageDataFamily._allTransitiveDependencies,
          id: id,
        );

  GetMessageDataProvider._internal(
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
    Stream<List<MessageData>> Function(GetMessageDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMessageDataProvider._internal(
        (ref) => create(ref as GetMessageDataRef),
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
  AutoDisposeStreamProviderElement<List<MessageData>> createElement() {
    return _GetMessageDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMessageDataProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMessageDataRef on AutoDisposeStreamProviderRef<List<MessageData>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetMessageDataProviderElement
    extends AutoDisposeStreamProviderElement<List<MessageData>>
    with GetMessageDataRef {
  _GetMessageDataProviderElement(super.provider);

  @override
  String get id => (origin as GetMessageDataProvider).id;
}

String _$cacheProfileDataHash() => r'9b3da715f3a1fab0207dbe80f0e951796a10093d';

/// See also [cacheProfileData].
@ProviderFor(cacheProfileData)
const cacheProfileDataProvider = CacheProfileDataFamily();

/// See also [cacheProfileData].
class CacheProfileDataFamily
    extends Family<AsyncValue<Map<String, ProfileData>>> {
  /// See also [cacheProfileData].
  const CacheProfileDataFamily();

  /// See also [cacheProfileData].
  CacheProfileDataProvider call(
    List<MessageData> data,
  ) {
    return CacheProfileDataProvider(
      data,
    );
  }

  @override
  CacheProfileDataProvider getProviderOverride(
    covariant CacheProfileDataProvider provider,
  ) {
    return call(
      provider.data,
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
  String? get name => r'cacheProfileDataProvider';
}

/// See also [cacheProfileData].
class CacheProfileDataProvider
    extends AutoDisposeFutureProvider<Map<String, ProfileData>> {
  /// See also [cacheProfileData].
  CacheProfileDataProvider(
    List<MessageData> data,
  ) : this._internal(
          (ref) => cacheProfileData(
            ref as CacheProfileDataRef,
            data,
          ),
          from: cacheProfileDataProvider,
          name: r'cacheProfileDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cacheProfileDataHash,
          dependencies: CacheProfileDataFamily._dependencies,
          allTransitiveDependencies:
              CacheProfileDataFamily._allTransitiveDependencies,
          data: data,
        );

  CacheProfileDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final List<MessageData> data;

  @override
  Override overrideWith(
    FutureOr<Map<String, ProfileData>> Function(CacheProfileDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CacheProfileDataProvider._internal(
        (ref) => create(ref as CacheProfileDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, ProfileData>> createElement() {
    return _CacheProfileDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CacheProfileDataProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CacheProfileDataRef
    on AutoDisposeFutureProviderRef<Map<String, ProfileData>> {
  /// The parameter `data` of this provider.
  List<MessageData> get data;
}

class _CacheProfileDataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, ProfileData>>
    with CacheProfileDataRef {
  _CacheProfileDataProviderElement(super.provider);

  @override
  List<MessageData> get data => (origin as CacheProfileDataProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
