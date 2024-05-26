// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaveGroupInput {
  List<Member> get members => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaveGroupInputCopyWith<SaveGroupInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveGroupInputCopyWith<$Res> {
  factory $SaveGroupInputCopyWith(
          SaveGroupInput value, $Res Function(SaveGroupInput) then) =
      _$SaveGroupInputCopyWithImpl<$Res, SaveGroupInput>;
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class _$SaveGroupInputCopyWithImpl<$Res, $Val extends SaveGroupInput>
    implements $SaveGroupInputCopyWith<$Res> {
  _$SaveGroupInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveGroupInputImplCopyWith<$Res>
    implements $SaveGroupInputCopyWith<$Res> {
  factory _$$SaveGroupInputImplCopyWith(_$SaveGroupInputImpl value,
          $Res Function(_$SaveGroupInputImpl) then) =
      __$$SaveGroupInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class __$$SaveGroupInputImplCopyWithImpl<$Res>
    extends _$SaveGroupInputCopyWithImpl<$Res, _$SaveGroupInputImpl>
    implements _$$SaveGroupInputImplCopyWith<$Res> {
  __$$SaveGroupInputImplCopyWithImpl(
      _$SaveGroupInputImpl _value, $Res Function(_$SaveGroupInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_$SaveGroupInputImpl(
      null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ));
  }
}

/// @nodoc

class _$SaveGroupInputImpl implements _SaveGroupInput {
  _$SaveGroupInputImpl(final List<Member> members) : _members = members;

  final List<Member> _members;
  @override
  List<Member> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'SaveGroupInput(members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveGroupInputImpl &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveGroupInputImplCopyWith<_$SaveGroupInputImpl> get copyWith =>
      __$$SaveGroupInputImplCopyWithImpl<_$SaveGroupInputImpl>(
          this, _$identity);
}

abstract class _SaveGroupInput implements SaveGroupInput {
  factory _SaveGroupInput(final List<Member> members) = _$SaveGroupInputImpl;

  @override
  List<Member> get members;
  @override
  @JsonKey(ignore: true)
  _$$SaveGroupInputImplCopyWith<_$SaveGroupInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Member {
  String get name => throw _privateConstructorUsedError;
  String get income => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call({String name, String income});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? income = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String income});
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? income = null,
  }) {
    return _then(_$MemberImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MemberImpl implements _Member {
  _$MemberImpl(this.name, this.income);

  @override
  final String name;
  @override
  final String income;

  @override
  String toString() {
    return 'Member(name: $name, income: $income)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.income, income) || other.income == income));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, income);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);
}

abstract class _Member implements Member {
  factory _Member(final String name, final String income) = _$MemberImpl;

  @override
  String get name;
  @override
  String get income;
  @override
  @JsonKey(ignore: true)
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
