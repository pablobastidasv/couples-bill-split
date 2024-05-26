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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Contributions {
  Contribution get memberA => throw _privateConstructorUsedError;
  Contribution get memberB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContributionsCopyWith<Contributions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionsCopyWith<$Res> {
  factory $ContributionsCopyWith(
          Contributions value, $Res Function(Contributions) then) =
      _$ContributionsCopyWithImpl<$Res, Contributions>;
  @useResult
  $Res call({Contribution memberA, Contribution memberB});

  $ContributionCopyWith<$Res> get memberA;
  $ContributionCopyWith<$Res> get memberB;
}

/// @nodoc
class _$ContributionsCopyWithImpl<$Res, $Val extends Contributions>
    implements $ContributionsCopyWith<$Res> {
  _$ContributionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberA = null,
    Object? memberB = null,
  }) {
    return _then(_value.copyWith(
      memberA: null == memberA
          ? _value.memberA
          : memberA // ignore: cast_nullable_to_non_nullable
              as Contribution,
      memberB: null == memberB
          ? _value.memberB
          : memberB // ignore: cast_nullable_to_non_nullable
              as Contribution,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContributionCopyWith<$Res> get memberA {
    return $ContributionCopyWith<$Res>(_value.memberA, (value) {
      return _then(_value.copyWith(memberA: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContributionCopyWith<$Res> get memberB {
    return $ContributionCopyWith<$Res>(_value.memberB, (value) {
      return _then(_value.copyWith(memberB: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContributionsImplCopyWith<$Res>
    implements $ContributionsCopyWith<$Res> {
  factory _$$ContributionsImplCopyWith(
          _$ContributionsImpl value, $Res Function(_$ContributionsImpl) then) =
      __$$ContributionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Contribution memberA, Contribution memberB});

  @override
  $ContributionCopyWith<$Res> get memberA;
  @override
  $ContributionCopyWith<$Res> get memberB;
}

/// @nodoc
class __$$ContributionsImplCopyWithImpl<$Res>
    extends _$ContributionsCopyWithImpl<$Res, _$ContributionsImpl>
    implements _$$ContributionsImplCopyWith<$Res> {
  __$$ContributionsImplCopyWithImpl(
      _$ContributionsImpl _value, $Res Function(_$ContributionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberA = null,
    Object? memberB = null,
  }) {
    return _then(_$ContributionsImpl(
      null == memberA
          ? _value.memberA
          : memberA // ignore: cast_nullable_to_non_nullable
              as Contribution,
      null == memberB
          ? _value.memberB
          : memberB // ignore: cast_nullable_to_non_nullable
              as Contribution,
    ));
  }
}

/// @nodoc

class _$ContributionsImpl implements _Contributions {
  _$ContributionsImpl(this.memberA, this.memberB);

  @override
  final Contribution memberA;
  @override
  final Contribution memberB;

  @override
  String toString() {
    return 'Contributions(memberA: $memberA, memberB: $memberB)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionsImpl &&
            (identical(other.memberA, memberA) || other.memberA == memberA) &&
            (identical(other.memberB, memberB) || other.memberB == memberB));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memberA, memberB);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionsImplCopyWith<_$ContributionsImpl> get copyWith =>
      __$$ContributionsImplCopyWithImpl<_$ContributionsImpl>(this, _$identity);
}

abstract class _Contributions implements Contributions {
  factory _Contributions(
          final Contribution memberA, final Contribution memberB) =
      _$ContributionsImpl;

  @override
  Contribution get memberA;
  @override
  Contribution get memberB;
  @override
  @JsonKey(ignore: true)
  _$$ContributionsImplCopyWith<_$ContributionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
abstract class _$$ContributionImplCopyWith<$Res>
    implements $ContributionCopyWith<$Res> {
  factory _$$ContributionImplCopyWith(
          _$ContributionImpl value, $Res Function(_$ContributionImpl) then) =
      __$$ContributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Decimal contribution});
}

/// @nodoc
class __$$ContributionImplCopyWithImpl<$Res>
    extends _$ContributionCopyWithImpl<$Res, _$ContributionImpl>
    implements _$$ContributionImplCopyWith<$Res> {
  __$$ContributionImplCopyWithImpl(
      _$ContributionImpl _value, $Res Function(_$ContributionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contribution = null,
  }) {
    return _then(_$ContributionImpl(
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

class _$ContributionImpl implements _Contribution {
  _$ContributionImpl(this.name, this.contribution);

  @override
  final String name;
  @override
  final Decimal contribution;

  @override
  String toString() {
    return 'Contribution(name: $name, contribution: $contribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contribution, contribution) ||
                other.contribution == contribution));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, contribution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionImplCopyWith<_$ContributionImpl> get copyWith =>
      __$$ContributionImplCopyWithImpl<_$ContributionImpl>(this, _$identity);
}

abstract class _Contribution implements Contribution {
  factory _Contribution(final String name, final Decimal contribution) =
      _$ContributionImpl;

  @override
  String get name;
  @override
  Decimal get contribution;
  @override
  @JsonKey(ignore: true)
  _$$ContributionImplCopyWith<_$ContributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
