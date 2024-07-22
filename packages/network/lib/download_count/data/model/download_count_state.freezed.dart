// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_count_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadCountState {
  DownloadCountModel get downloadCountModel =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadCountStateCopyWith<DownloadCountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadCountStateCopyWith<$Res> {
  factory $DownloadCountStateCopyWith(
          DownloadCountState value, $Res Function(DownloadCountState) then) =
      _$DownloadCountStateCopyWithImpl<$Res, DownloadCountState>;
  @useResult
  $Res call(
      {DownloadCountModel downloadCountModel,
      bool isLoading,
      bool isLoadingMore});

  $DownloadCountModelCopyWith<$Res> get downloadCountModel;
}

/// @nodoc
class _$DownloadCountStateCopyWithImpl<$Res, $Val extends DownloadCountState>
    implements $DownloadCountStateCopyWith<$Res> {
  _$DownloadCountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadCountModel = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      downloadCountModel: null == downloadCountModel
          ? _value.downloadCountModel
          : downloadCountModel // ignore: cast_nullable_to_non_nullable
              as DownloadCountModel,
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
  $DownloadCountModelCopyWith<$Res> get downloadCountModel {
    return $DownloadCountModelCopyWith<$Res>(_value.downloadCountModel,
        (value) {
      return _then(_value.copyWith(downloadCountModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DownloadCountStateImplCopyWith<$Res>
    implements $DownloadCountStateCopyWith<$Res> {
  factory _$$DownloadCountStateImplCopyWith(_$DownloadCountStateImpl value,
          $Res Function(_$DownloadCountStateImpl) then) =
      __$$DownloadCountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DownloadCountModel downloadCountModel,
      bool isLoading,
      bool isLoadingMore});

  @override
  $DownloadCountModelCopyWith<$Res> get downloadCountModel;
}

/// @nodoc
class __$$DownloadCountStateImplCopyWithImpl<$Res>
    extends _$DownloadCountStateCopyWithImpl<$Res, _$DownloadCountStateImpl>
    implements _$$DownloadCountStateImplCopyWith<$Res> {
  __$$DownloadCountStateImplCopyWithImpl(_$DownloadCountStateImpl _value,
      $Res Function(_$DownloadCountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadCountModel = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$DownloadCountStateImpl(
      downloadCountModel: null == downloadCountModel
          ? _value.downloadCountModel
          : downloadCountModel // ignore: cast_nullable_to_non_nullable
              as DownloadCountModel,
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

class _$DownloadCountStateImpl implements _DownloadCountState {
  _$DownloadCountStateImpl(
      {this.downloadCountModel = const DownloadCountModel(),
      this.isLoading = true,
      this.isLoadingMore = true});

  @override
  @JsonKey()
  final DownloadCountModel downloadCountModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'DownloadCountState(downloadCountModel: $downloadCountModel, isLoading: $isLoading, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadCountStateImpl &&
            (identical(other.downloadCountModel, downloadCountModel) ||
                other.downloadCountModel == downloadCountModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, downloadCountModel, isLoading, isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadCountStateImplCopyWith<_$DownloadCountStateImpl> get copyWith =>
      __$$DownloadCountStateImplCopyWithImpl<_$DownloadCountStateImpl>(
          this, _$identity);
}

abstract class _DownloadCountState implements DownloadCountState {
  factory _DownloadCountState(
      {final DownloadCountModel downloadCountModel,
      final bool isLoading,
      final bool isLoadingMore}) = _$DownloadCountStateImpl;

  @override
  DownloadCountModel get downloadCountModel;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$DownloadCountStateImplCopyWith<_$DownloadCountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
