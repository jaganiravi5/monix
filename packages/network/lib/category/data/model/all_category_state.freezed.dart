// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllCategoryState {
  AllCategoryModel get allCategory => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllCategoryStateCopyWith<AllCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCategoryStateCopyWith<$Res> {
  factory $AllCategoryStateCopyWith(
          AllCategoryState value, $Res Function(AllCategoryState) then) =
      _$AllCategoryStateCopyWithImpl<$Res, AllCategoryState>;
  @useResult
  $Res call({AllCategoryModel allCategory, bool isLoading, bool isLoadingMore});

  $AllCategoryModelCopyWith<$Res> get allCategory;
}

/// @nodoc
class _$AllCategoryStateCopyWithImpl<$Res, $Val extends AllCategoryState>
    implements $AllCategoryStateCopyWith<$Res> {
  _$AllCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allCategory = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      allCategory: null == allCategory
          ? _value.allCategory
          : allCategory // ignore: cast_nullable_to_non_nullable
              as AllCategoryModel,
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
  $AllCategoryModelCopyWith<$Res> get allCategory {
    return $AllCategoryModelCopyWith<$Res>(_value.allCategory, (value) {
      return _then(_value.copyWith(allCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AllCategoryStateImplCopyWith<$Res>
    implements $AllCategoryStateCopyWith<$Res> {
  factory _$$AllCategoryStateImplCopyWith(_$AllCategoryStateImpl value,
          $Res Function(_$AllCategoryStateImpl) then) =
      __$$AllCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AllCategoryModel allCategory, bool isLoading, bool isLoadingMore});

  @override
  $AllCategoryModelCopyWith<$Res> get allCategory;
}

/// @nodoc
class __$$AllCategoryStateImplCopyWithImpl<$Res>
    extends _$AllCategoryStateCopyWithImpl<$Res, _$AllCategoryStateImpl>
    implements _$$AllCategoryStateImplCopyWith<$Res> {
  __$$AllCategoryStateImplCopyWithImpl(_$AllCategoryStateImpl _value,
      $Res Function(_$AllCategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allCategory = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$AllCategoryStateImpl(
      allCategory: null == allCategory
          ? _value.allCategory
          : allCategory // ignore: cast_nullable_to_non_nullable
              as AllCategoryModel,
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

class _$AllCategoryStateImpl implements _AllCategoryState {
  _$AllCategoryStateImpl(
      {this.allCategory = const AllCategoryModel(),
      this.isLoading = true,
      this.isLoadingMore = true});

  @override
  @JsonKey()
  final AllCategoryModel allCategory;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'AllCategoryState(allCategory: $allCategory, isLoading: $isLoading, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllCategoryStateImpl &&
            (identical(other.allCategory, allCategory) ||
                other.allCategory == allCategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, allCategory, isLoading, isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllCategoryStateImplCopyWith<_$AllCategoryStateImpl> get copyWith =>
      __$$AllCategoryStateImplCopyWithImpl<_$AllCategoryStateImpl>(
          this, _$identity);
}

abstract class _AllCategoryState implements AllCategoryState {
  factory _AllCategoryState(
      {final AllCategoryModel allCategory,
      final bool isLoading,
      final bool isLoadingMore}) = _$AllCategoryStateImpl;

  @override
  AllCategoryModel get allCategory;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$AllCategoryStateImplCopyWith<_$AllCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
