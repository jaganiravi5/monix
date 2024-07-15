// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubCategoryState {
  SubCategoryModel get subCategory => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubCategoryStateCopyWith<SubCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryStateCopyWith<$Res> {
  factory $SubCategoryStateCopyWith(
          SubCategoryState value, $Res Function(SubCategoryState) then) =
      _$SubCategoryStateCopyWithImpl<$Res, SubCategoryState>;
  @useResult
  $Res call({SubCategoryModel subCategory, bool isLoading, bool isLoadingMore});

  $SubCategoryModelCopyWith<$Res> get subCategory;
}

/// @nodoc
class _$SubCategoryStateCopyWithImpl<$Res, $Val extends SubCategoryState>
    implements $SubCategoryStateCopyWith<$Res> {
  _$SubCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subCategory = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as SubCategoryModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubCategoryModelCopyWith<$Res> get subCategory {
    return $SubCategoryModelCopyWith<$Res>(_value.subCategory, (value) {
      return _then(_value.copyWith(subCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubCategoryStateImplCopyWith<$Res>
    implements $SubCategoryStateCopyWith<$Res> {
  factory _$$SubCategoryStateImplCopyWith(_$SubCategoryStateImpl value,
          $Res Function(_$SubCategoryStateImpl) then) =
      __$$SubCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SubCategoryModel subCategory, bool isLoading, bool isLoadingMore});

  @override
  $SubCategoryModelCopyWith<$Res> get subCategory;
}

/// @nodoc
class __$$SubCategoryStateImplCopyWithImpl<$Res>
    extends _$SubCategoryStateCopyWithImpl<$Res, _$SubCategoryStateImpl>
    implements _$$SubCategoryStateImplCopyWith<$Res> {
  __$$SubCategoryStateImplCopyWithImpl(_$SubCategoryStateImpl _value,
      $Res Function(_$SubCategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subCategory = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$SubCategoryStateImpl(
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as SubCategoryModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SubCategoryStateImpl implements _SubCategoryState {
  _$SubCategoryStateImpl(
      {this.subCategory = const SubCategoryModel(),
      this.isLoading = true,
      this.isLoadingMore = true});

  @override
  @JsonKey()
  final SubCategoryModel subCategory;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'SubCategoryState(subCategory: $subCategory, isLoading: $isLoading, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryStateImpl &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, subCategory, isLoading, isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryStateImplCopyWith<_$SubCategoryStateImpl> get copyWith =>
      __$$SubCategoryStateImplCopyWithImpl<_$SubCategoryStateImpl>(
          this, _$identity);
}

abstract class _SubCategoryState implements SubCategoryState {
  factory _SubCategoryState(
      {final SubCategoryModel subCategory,
      final bool isLoading,
      final bool isLoadingMore}) = _$SubCategoryStateImpl;

  @override
  SubCategoryModel get subCategory;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$SubCategoryStateImplCopyWith<_$SubCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
