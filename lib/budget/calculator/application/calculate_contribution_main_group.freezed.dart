// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculate_contribution_main_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Contribution {
  String get name => throw _privateConstructorUsedError;
  Decimal get contribution => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContributionCopyWith<Contribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionCopyWith<$Res> {
  factory $ContributionCopyWith(
          Contribution value, $Res Function(Contribution) then) =
      _$ContributionCopyWithImpl<$Res, Contribution>;
  @useResult
  $Res call({String name, Decimal contribution});
}

/// @nodoc
class _$ContributionCopyWithImpl<$Res, $Val extends Contribution>
    implements $ContributionCopyWith<$Res> {
  _$ContributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contribution = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contribution: null == contribution
          ? _value.contribution
          : contribution // ignore: cast_nullable_to_non_nullable
              as Decimal,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContributionCopyWith<$Res>
    implements $ContributionCopyWith<$Res> {
  factory _$$_ContributionCopyWith(
          _$_Contribution value, $Res Function(_$_Contribution) then) =
      __$$_ContributionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Decimal contribution});
}

/// @nodoc
class __$$_ContributionCopyWithImpl<$Res>
    extends _$ContributionCopyWithImpl<$Res, _$_Contribution>
    implements _$$_ContributionCopyWith<$Res> {
  __$$_ContributionCopyWithImpl(
      _$_Contribution _value, $Res Function(_$_Contribution) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contribution = null,
  }) {
    return _then(_$_Contribution(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == contribution
          ? _value.contribution
          : contribution // ignore: cast_nullable_to_non_nullable
              as Decimal,
    ));
  }
}

/// @nodoc

class _$_Contribution implements _Contribution {
  _$_Contribution(this.name, this.contribution);

  @override
  final String name;
  @override
  final Decimal contribution;

  @override
  String toString() {
    return 'Contribution(name: $name, contribution: $contribution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contribution &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contribution, contribution) ||
                other.contribution == contribution));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, contribution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContributionCopyWith<_$_Contribution> get copyWith =>
      __$$_ContributionCopyWithImpl<_$_Contribution>(this, _$identity);
}

abstract class _Contribution implements Contribution {
  factory _Contribution(final String name, final Decimal contribution) =
      _$_Contribution;

  @override
  String get name;
  @override
  Decimal get contribution;
  @override
  @JsonKey(ignore: true)
  _$$_ContributionCopyWith<_$_Contribution> get copyWith =>
      throw _privateConstructorUsedError;
}
