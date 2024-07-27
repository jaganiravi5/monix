// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdsState {
  AdsModel get adsModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdsStateCopyWith<AdsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsStateCopyWith<$Res> {
  factory $AdsStateCopyWith(AdsState value, $Res Function(AdsState) then) =
      _$AdsStateCopyWithImpl<$Res, AdsState>;
  @useResult
  $Res call({AdsModel adsModel, bool isLoading, bool isLoadingMore});

  $AdsModelCopyWith<$Res> get adsModel;
}

/// @nodoc
class _$AdsStateCopyWithImpl<$Res, $Val extends AdsState>
    implements $AdsStateCopyWith<$Res> {
  _$AdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adsModel = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      adsModel: null == adsModel
          ? _value.adsModel
          : adsModel // ignore: cast_nullable_to_non_nullable
              as AdsModel,
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
  $AdsModelCopyWith<$Res> get adsModel {
    return $AdsModelCopyWith<$Res>(_value.adsModel, (value) {
      return _then(_value.copyWith(adsModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdsStateImplCopyWith<$Res>
    implements $AdsStateCopyWith<$Res> {
  factory _$$AdsStateImplCopyWith(
          _$AdsStateImpl value, $Res Function(_$AdsStateImpl) then) =
      __$$AdsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AdsModel adsModel, bool isLoading, bool isLoadingMore});

  @override
  $AdsModelCopyWith<$Res> get adsModel;
}

/// @nodoc
class __$$AdsStateImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$AdsStateImpl>
    implements _$$AdsStateImplCopyWith<$Res> {
  __$$AdsStateImplCopyWithImpl(
      _$AdsStateImpl _value, $Res Function(_$AdsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adsModel = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$AdsStateImpl(
      adsModel: null == adsModel
          ? _value.adsModel
          : adsModel // ignore: cast_nullable_to_non_nullable
              as AdsModel,
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

class _$AdsStateImpl implements _AdsState {
  _$AdsStateImpl(
      {this.adsModel = const AdsModel(),
      this.isLoading = true,
      this.isLoadingMore = true});

  @override
  @JsonKey()
  final AdsModel adsModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'AdsState(adsModel: $adsModel, isLoading: $isLoading, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsStateImpl &&
            (identical(other.adsModel, adsModel) ||
                other.adsModel == adsModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, adsModel, isLoading, isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdsStateImplCopyWith<_$AdsStateImpl> get copyWith =>
      __$$AdsStateImplCopyWithImpl<_$AdsStateImpl>(this, _$identity);
}

abstract class _AdsState implements AdsState {
  factory _AdsState(
      {final AdsModel adsModel,
      final bool isLoading,
      final bool isLoadingMore}) = _$AdsStateImpl;

  @override
  AdsModel get adsModel;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$AdsStateImplCopyWith<_$AdsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
