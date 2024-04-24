// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskListHash() => r'92200edcd7a32ab23a8c8f95853fc9531bf865d5';

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

/// See also [taskList].
@ProviderFor(taskList)
const taskListProvider = TaskListFamily();

/// See also [taskList].
class TaskListFamily extends Family<AsyncValue<List<TaskData>?>> {
  /// See also [taskList].
  const TaskListFamily();

  /// See also [taskList].
  TaskListProvider call(
    int id,
  ) {
    return TaskListProvider(
      id,
    );
  }

  @override
  TaskListProvider getProviderOverride(
    covariant TaskListProvider provider,
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
  String? get name => r'taskListProvider';
}

/// See also [taskList].
class TaskListProvider extends AutoDisposeFutureProvider<List<TaskData>?> {
  /// See also [taskList].
  TaskListProvider(
    int id,
  ) : this._internal(
          (ref) => taskList(
            ref as TaskListRef,
            id,
          ),
          from: taskListProvider,
          name: r'taskListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskListHash,
          dependencies: TaskListFamily._dependencies,
          allTransitiveDependencies: TaskListFamily._allTransitiveDependencies,
          id: id,
        );

  TaskListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<List<TaskData>?> Function(TaskListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TaskListProvider._internal(
        (ref) => create(ref as TaskListRef),
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
  AutoDisposeFutureProviderElement<List<TaskData>?> createElement() {
    return _TaskListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskListProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TaskListRef on AutoDisposeFutureProviderRef<List<TaskData>?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TaskListProviderElement
    extends AutoDisposeFutureProviderElement<List<TaskData>?> with TaskListRef {
  _TaskListProviderElement(super.provider);

  @override
  int get id => (origin as TaskListProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
