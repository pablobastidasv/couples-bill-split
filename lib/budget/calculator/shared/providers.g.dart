// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

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

String _$isarHash() => r'85e5cc68d78cacfb380c55f3eb77229e17b4af84';

/// See also [isar].
final isarProvider = FutureProvider<Isar>(
  isar,
  name: r'isarProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarHash,
);
typedef IsarRef = FutureProviderRef<Isar>;
String _$repositoryHash() => r'6e15e79237e8be67308d40284064aafc03924916';

/// See also [repository].
final repositoryProvider = FutureProvider<Repository>(
  repository,
  name: r'repositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$repositoryHash,
);
typedef RepositoryRef = FutureProviderRef<Repository>;
String _$saveMainGroupHash() => r'055d7c5e8090c17f086dc0cfc0148214a0ccebdb';

/// See also [saveMainGroup].
final saveMainGroupProvider = AutoDisposeFutureProvider<SaveMainGroup>(
  saveMainGroup,
  name: r'saveMainGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$saveMainGroupHash,
);
typedef SaveMainGroupRef = AutoDisposeFutureProviderRef<SaveMainGroup>;
String _$calculateContributionInMainGroupHash() =>
    r'cc31f426e2d1ed89c13fffa91618cb1f1e99e1c4';

/// See also [calculateContributionInMainGroup].
final calculateContributionInMainGroupProvider =
    AutoDisposeFutureProvider<CalculateContributionInMainGroup>(
  calculateContributionInMainGroup,
  name: r'calculateContributionInMainGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calculateContributionInMainGroupHash,
);
typedef CalculateContributionInMainGroupRef
    = AutoDisposeFutureProviderRef<CalculateContributionInMainGroup>;
String _$findMainGroupHash() => r'5275b54b0ae06d06bb7618b0528dfd0744286594';

/// See also [findMainGroup].
final findMainGroupProvider = AutoDisposeFutureProvider<FindMainGroup>(
  findMainGroup,
  name: r'findMainGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findMainGroupHash,
);
typedef FindMainGroupRef = AutoDisposeFutureProviderRef<FindMainGroup>;
