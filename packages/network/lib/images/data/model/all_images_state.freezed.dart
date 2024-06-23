// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_images_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllImagesState {
  AllImageModel get allImages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllImagesStateCopyWith<AllImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllImagesStateCopyWith<$Res> {
  factory $AllImagesStateCopyWith(
          AllImagesState value, $Res Function(AllImagesState) then) =
      _$AllImagesStateCopyWithImpl<$Res, AllImagesState>;
  @useResult
  $Res call({AllImageModel allImages, bool isLoading, bool isLoadingMore});

  $AllImageModelCopyWith<$Res> get allImages;
}

/// @nodoc
class _$AllImagesStateCopyWithImpl<$Res, $Val extends AllImagesState>
    implements $AllImagesStateCopyWith<$Res> {
  _$AllImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allImages = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      allImages: null == allImages
          ? _value.allImages
          : allImages // ignore: cast_nullable_to_non_nullable
              as AllImageModel,
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
  $AllImageModelCopyWith<$Res> get allImages {
    return $AllImageModelCopyWith<$Res>(_value.allImages, (value) {
      return _then(_value.copyWith(allImages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AllImagesStateImplCopyWith<$Res>
    implements $AllImagesStateCopyWith<$Res> {
  factory _$$AllImagesStateImplCopyWith(_$AllImagesStateImpl value,
          $Res Function(_$AllImagesStateImpl) then) =
      __$$AllImagesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AllImageModel allImages, bool isLoading, bool isLoadingMore});

  @override
  $AllImageModelCopyWith<$Res> get allImages;
}

/// @nodoc
class __$$AllImagesStateImplCopyWithImpl<$Res>
    extends _$AllImagesStateCopyWithImpl<$Res, _$AllImagesStateImpl>
    implements _$$AllImagesStateImplCopyWith<$Res> {
  __$$AllImagesStateImplCopyWithImpl(
      _$AllImagesStateImpl _value, $Res Function(_$AllImagesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allImages = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$AllImagesStateImpl(
      allImages: null == allImages
          ? _value.allImages
          : allImages // ignore: cast_nullable_to_non_nullable
              as AllImageModel,
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

class _$AllImagesStateImpl implements _AllImagesState {
  _$AllImagesStateImpl(
      {this.allImages = const AllImageModel(),
      this.isLoading = true,
      this.isLoadingMore = true});

  @override
  @JsonKey()
  final AllImageModel allImages;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'AllImagesState(allImages: $allImages, isLoading: $isLoading, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllImagesStateImpl &&
            (identical(other.allImages, allImages) ||
                other.allImages == allImages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, allImages, isLoading, isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllImagesStateImplCopyWith<_$AllImagesStateImpl> get copyWith =>
      __$$AllImagesStateImplCopyWithImpl<_$AllImagesStateImpl>(
          this, _$identity);
}

abstract class _AllImagesState implements AllImagesState {
  factory _AllImagesState(
      {final AllImageModel allImages,
      final bool isLoading,
      final bool isLoadingMore}) = _$AllImagesStateImpl;

  @override
  AllImageModel get allImages;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$AllImagesStateImplCopyWith<_$AllImagesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
