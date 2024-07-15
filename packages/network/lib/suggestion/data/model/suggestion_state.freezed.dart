// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SuggestionState {
  SuggestionModel get suggestion => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestionStateCopyWith<SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionStateCopyWith<$Res> {
  factory $SuggestionStateCopyWith(
          SuggestionState value, $Res Function(SuggestionState) then) =
      _$SuggestionStateCopyWithImpl<$Res, SuggestionState>;
  @useResult
  $Res call({SuggestionModel suggestion, bool isLoading, bool isLoadingMore});

  $SuggestionModelCopyWith<$Res> get suggestion;
}

/// @nodoc
class _$SuggestionStateCopyWithImpl<$Res, $Val extends SuggestionState>
    implements $SuggestionStateCopyWith<$Res> {
  _$SuggestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestion = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      suggestion: null == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as SuggestionModel,
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
  $SuggestionModelCopyWith<$Res> get suggestion {
    return $SuggestionModelCopyWith<$Res>(_value.suggestion, (value) {
      return _then(_value.copyWith(suggestion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SuggestionStateImplCopyWith<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  factory _$$SuggestionStateImplCopyWith(_$SuggestionStateImpl value,
          $Res Function(_$SuggestionStateImpl) then) =
      __$$SuggestionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SuggestionModel suggestion, bool isLoading, bool isLoadingMore});

  @override
  $SuggestionModelCopyWith<$Res> get suggestion;
}

/// @nodoc
class __$$SuggestionStateImplCopyWithImpl<$Res>
    extends _$SuggestionStateCopyWithImpl<$Res, _$SuggestionStateImpl>
    implements _$$SuggestionStateImplCopyWith<$Res> {
  __$$SuggestionStateImplCopyWithImpl(
      _$SuggestionStateImpl _value, $Res Function(_$SuggestionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestion = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$SuggestionStateImpl(
      suggestion: null == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as SuggestionModel,
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

class _$SuggestionStateImpl implements _SuggestionState {
  _$SuggestionStateImpl(
      {this.suggestion = const SuggestionModel(),
      this.isLoading = true,
      this.isLoadingMore = true});

  @override
  @JsonKey()
  final SuggestionModel suggestion;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'SuggestionState(suggestion: $suggestion, isLoading: $isLoading, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionStateImpl &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, suggestion, isLoading, isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionStateImplCopyWith<_$SuggestionStateImpl> get copyWith =>
      __$$SuggestionStateImplCopyWithImpl<_$SuggestionStateImpl>(
          this, _$identity);
}

abstract class _SuggestionState implements SuggestionState {
  factory _SuggestionState(
      {final SuggestionModel suggestion,
      final bool isLoading,
      final bool isLoadingMore}) = _$SuggestionStateImpl;

  @override
  SuggestionModel get suggestion;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionStateImplCopyWith<_$SuggestionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
