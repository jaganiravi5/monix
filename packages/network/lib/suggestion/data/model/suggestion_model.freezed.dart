// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuggestionModel _$SuggestionModelFromJson(Map<String, dynamic> json) {
  return _SuggestionModel.fromJson(json);
}

/// @nodoc
mixin _$SuggestionModel {
  String? get name => throw _privateConstructorUsedError;
  String? get suggestion => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestionModelCopyWith<SuggestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionModelCopyWith<$Res> {
  factory $SuggestionModelCopyWith(
          SuggestionModel value, $Res Function(SuggestionModel) then) =
      _$SuggestionModelCopyWithImpl<$Res, SuggestionModel>;
  @useResult
  $Res call(
      {String? name,
      String? suggestion,
      @JsonKey(name: '_id') String? id,
      int? v});
}

/// @nodoc
class _$SuggestionModelCopyWithImpl<$Res, $Val extends SuggestionModel>
    implements $SuggestionModelCopyWith<$Res> {
  _$SuggestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? suggestion = freezed,
    Object? id = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestion: freezed == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionModelImplCopyWith<$Res>
    implements $SuggestionModelCopyWith<$Res> {
  factory _$$SuggestionModelImplCopyWith(_$SuggestionModelImpl value,
          $Res Function(_$SuggestionModelImpl) then) =
      __$$SuggestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? suggestion,
      @JsonKey(name: '_id') String? id,
      int? v});
}

/// @nodoc
class __$$SuggestionModelImplCopyWithImpl<$Res>
    extends _$SuggestionModelCopyWithImpl<$Res, _$SuggestionModelImpl>
    implements _$$SuggestionModelImplCopyWith<$Res> {
  __$$SuggestionModelImplCopyWithImpl(
      _$SuggestionModelImpl _value, $Res Function(_$SuggestionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? suggestion = freezed,
    Object? id = freezed,
    Object? v = freezed,
  }) {
    return _then(_$SuggestionModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestion: freezed == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionModelImpl implements _SuggestionModel {
  const _$SuggestionModelImpl(
      {this.name, this.suggestion, @JsonKey(name: '_id') this.id, this.v});

  factory _$SuggestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? suggestion;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? v;

  @override
  String toString() {
    return 'SuggestionModel(name: $name, suggestion: $suggestion, id: $id, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, suggestion, id, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionModelImplCopyWith<_$SuggestionModelImpl> get copyWith =>
      __$$SuggestionModelImplCopyWithImpl<_$SuggestionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionModelImplToJson(
      this,
    );
  }
}

abstract class _SuggestionModel implements SuggestionModel {
  const factory _SuggestionModel(
      {final String? name,
      final String? suggestion,
      @JsonKey(name: '_id') final String? id,
      final int? v}) = _$SuggestionModelImpl;

  factory _SuggestionModel.fromJson(Map<String, dynamic> json) =
      _$SuggestionModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get suggestion;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  int? get v;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionModelImplCopyWith<_$SuggestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
