// Mocks generated by Mockito 5.4.4 from annotations
// in couple_budget_calculator/test/budget/calculator/views/pages/save_main_group_members_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:couple_budget_calculator/budget/calculator/application/find_main_group.dart'
    as _i4;
import 'package:couple_budget_calculator/budget/calculator/application/save_group.dart'
    as _i2;
import 'package:couple_budget_calculator/budget/calculator/domain/models.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SaveMainGroup].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveMainGroup extends _i1.Mock implements _i2.SaveMainGroup {
  @override
  _i3.Future<void> save(_i2.SaveGroupInput? input) => (super.noSuchMethod(
        Invocation.method(
          #save,
          [input],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [FindMainGroup].
///
/// See the documentation for Mockito's code generation for more information.
class MockFindMainGroup extends _i1.Mock implements _i4.FindMainGroup {
  @override
  _i3.Future<_i5.Group?> findIt() => (super.noSuchMethod(
        Invocation.method(
          #findIt,
          [],
        ),
        returnValue: _i3.Future<_i5.Group?>.value(),
        returnValueForMissingStub: _i3.Future<_i5.Group?>.value(),
      ) as _i3.Future<_i5.Group?>);
}
