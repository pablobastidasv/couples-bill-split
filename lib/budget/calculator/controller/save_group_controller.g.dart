// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_group_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$saveMainGroupControllerHash() =>
    r'6b725d469e8386e9a7e4b9f804eece09578218cb';

/// See also [saveMainGroupController].
class SaveMainGroupControllerProvider extends AutoDisposeFutureProvider<void> {
  SaveMainGroupControllerProvider({
    required this.members,
  }) : super(
          (ref) => saveMainGroupController(
            ref,
            members: members,
          ),
          from: saveMainGroupControllerProvider,
          name: r'saveMainGroupControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveMainGroupControllerHash,
        );

  final List<Member> members;

  @override
  bool operator ==(Object other) {
    return other is SaveMainGroupControllerProvider && other.members == members;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, members.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SaveMainGroupControllerRef = AutoDisposeFutureProviderRef<void>;

/// See also [saveMainGroupController].
final saveMainGroupControllerProvider = SaveMainGroupControllerFamily();

class SaveMainGroupControllerFamily extends Family<AsyncValue<void>> {
  SaveMainGroupControllerFamily();

  SaveMainGroupControllerProvider call({
    required List<Member> members,
  }) {
    return SaveMainGroupControllerProvider(
      members: members,
    );
  }

  @override
  AutoDisposeFutureProvider<void> getProviderOverride(
    covariant SaveMainGroupControllerProvider provider,
  ) {
    return call(
      members: provider.members,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'saveMainGroupControllerProvider';
}
