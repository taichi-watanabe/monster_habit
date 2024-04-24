// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectives.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$objectivesListHash() => r'ef73dcefb8d3add5e11c9129e34bffdb802e3fae';

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

/// See also [objectivesList].
@ProviderFor(objectivesList)
const objectivesListProvider = ObjectivesListFamily();

/// See also [objectivesList].
class ObjectivesListFamily extends Family<AsyncValue<List<ObjectivesData>>> {
  /// See also [objectivesList].
  const ObjectivesListFamily();

  /// See also [objectivesList].
  ObjectivesListProvider call(
    String id,
  ) {
    return ObjectivesListProvider(
      id,
    );
  }

  @override
  ObjectivesListProvider getProviderOverride(
    covariant ObjectivesListProvider provider,
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
  String? get name => r'objectivesListProvider';
}

/// See also [objectivesList].
class ObjectivesListProvider
    extends AutoDisposeFutureProvider<List<ObjectivesData>> {
  /// See also [objectivesList].
  ObjectivesListProvider(
    String id,
  ) : this._internal(
          (ref) => objectivesList(
            ref as ObjectivesListRef,
            id,
          ),
          from: objectivesListProvider,
          name: r'objectivesListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$objectivesListHash,
          dependencies: ObjectivesListFamily._dependencies,
          allTransitiveDependencies:
              ObjectivesListFamily._allTransitiveDependencies,
          id: id,
        );

  ObjectivesListProvider._internal(
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
    FutureOr<List<ObjectivesData>> Function(ObjectivesListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ObjectivesListProvider._internal(
        (ref) => create(ref as ObjectivesListRef),
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
  AutoDisposeFutureProviderElement<List<ObjectivesData>> createElement() {
    return _ObjectivesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObjectivesListProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ObjectivesListRef on AutoDisposeFutureProviderRef<List<ObjectivesData>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ObjectivesListProviderElement
    extends AutoDisposeFutureProviderElement<List<ObjectivesData>>
    with ObjectivesListRef {
  _ObjectivesListProviderElement(super.provider);

  @override
  String get id => (origin as ObjectivesListProvider).id;
}

String _$objectiveHash() => r'ce8b083dbac3c87c54414c453dff22eaceff77d1';

/// See also [objective].
@ProviderFor(objective)
const objectiveProvider = ObjectiveFamily();

/// See also [objective].
class ObjectiveFamily extends Family<AsyncValue<ObjectivesData?>> {
  /// See also [objective].
  const ObjectiveFamily();

  /// See also [objective].
  ObjectiveProvider call(
    String uuid,
    int id,
  ) {
    return ObjectiveProvider(
      uuid,
      id,
    );
  }

  @override
  ObjectiveProvider getProviderOverride(
    covariant ObjectiveProvider provider,
  ) {
    return call(
      provider.uuid,
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
  String? get name => r'objectiveProvider';
}

/// See also [objective].
class ObjectiveProvider extends AutoDisposeFutureProvider<ObjectivesData?> {
  /// See also [objective].
  ObjectiveProvider(
    String uuid,
    int id,
  ) : this._internal(
          (ref) => objective(
            ref as ObjectiveRef,
            uuid,
            id,
          ),
          from: objectiveProvider,
          name: r'objectiveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$objectiveHash,
          dependencies: ObjectiveFamily._dependencies,
          allTransitiveDependencies: ObjectiveFamily._allTransitiveDependencies,
          uuid: uuid,
          id: id,
        );

  ObjectiveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
    required this.id,
  }) : super.internal();

  final String uuid;
  final int id;

  @override
  Override overrideWith(
    FutureOr<ObjectivesData?> Function(ObjectiveRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ObjectiveProvider._internal(
        (ref) => create(ref as ObjectiveRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ObjectivesData?> createElement() {
    return _ObjectiveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObjectiveProvider && other.uuid == uuid && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ObjectiveRef on AutoDisposeFutureProviderRef<ObjectivesData?> {
  /// The parameter `uuid` of this provider.
  String get uuid;

  /// The parameter `id` of this provider.
  int get id;
}

class _ObjectiveProviderElement
    extends AutoDisposeFutureProviderElement<ObjectivesData?>
    with ObjectiveRef {
  _ObjectiveProviderElement(super.provider);

  @override
  String get uuid => (origin as ObjectiveProvider).uuid;
  @override
  int get id => (origin as ObjectiveProvider).id;
}

String _$objectiveIdHash() => r'5c09585970d5a513ad2fd405e8eac937579e8a19';

/// See also [objectiveId].
@ProviderFor(objectiveId)
const objectiveIdProvider = ObjectiveIdFamily();

/// See also [objectiveId].
class ObjectiveIdFamily extends Family<AsyncValue<int?>> {
  /// See also [objectiveId].
  const ObjectiveIdFamily();

  /// See also [objectiveId].
  ObjectiveIdProvider call(
    String uuid,
  ) {
    return ObjectiveIdProvider(
      uuid,
    );
  }

  @override
  ObjectiveIdProvider getProviderOverride(
    covariant ObjectiveIdProvider provider,
  ) {
    return call(
      provider.uuid,
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
  String? get name => r'objectiveIdProvider';
}

/// See also [objectiveId].
class ObjectiveIdProvider extends AutoDisposeFutureProvider<int?> {
  /// See also [objectiveId].
  ObjectiveIdProvider(
    String uuid,
  ) : this._internal(
          (ref) => objectiveId(
            ref as ObjectiveIdRef,
            uuid,
          ),
          from: objectiveIdProvider,
          name: r'objectiveIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$objectiveIdHash,
          dependencies: ObjectiveIdFamily._dependencies,
          allTransitiveDependencies:
              ObjectiveIdFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  ObjectiveIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  Override overrideWith(
    FutureOr<int?> Function(ObjectiveIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ObjectiveIdProvider._internal(
        (ref) => create(ref as ObjectiveIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _ObjectiveIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObjectiveIdProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ObjectiveIdRef on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _ObjectiveIdProviderElement extends AutoDisposeFutureProviderElement<int?>
    with ObjectiveIdRef {
  _ObjectiveIdProviderElement(super.provider);

  @override
  String get uuid => (origin as ObjectiveIdProvider).uuid;
}

String _$getMonsterUrlHash() => r'259fa88dc607e9b773ea323de33aea861a9c7279';

/// See also [getMonsterUrl].
@ProviderFor(getMonsterUrl)
final getMonsterUrlProvider = AutoDisposeFutureProvider<String>.internal(
  getMonsterUrl,
  name: r'getMonsterUrlProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMonsterUrlHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMonsterUrlRef = AutoDisposeFutureProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
