// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_images_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllImageModel _$AllImageModelFromJson(Map<String, dynamic> json) {
  return _AllImageModel.fromJson(json);
}

/// @nodoc
mixin _$AllImageModel {
  List<ImagesDataModel>? get imagess => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllImageModelCopyWith<AllImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllImageModelCopyWith<$Res> {
  factory $AllImageModelCopyWith(
          AllImageModel value, $Res Function(AllImageModel) then) =
      _$AllImageModelCopyWithImpl<$Res, AllImageModel>;
  @useResult
  $Res call(
      {List<ImagesDataModel>? imagess,
      String? message,
      bool? success,
      int? total});
}

/// @nodoc
class _$AllImageModelCopyWithImpl<$Res, $Val extends AllImageModel>
    implements $AllImageModelCopyWith<$Res> {
  _$AllImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagess = freezed,
    Object? message = freezed,
    Object? success = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      imagess: freezed == imagess
          ? _value.imagess
          : imagess // ignore: cast_nullable_to_non_nullable
              as List<ImagesDataModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllImageModelImplCopyWith<$Res>
    implements $AllImageModelCopyWith<$Res> {
  factory _$$AllImageModelImplCopyWith(
          _$AllImageModelImpl value, $Res Function(_$AllImageModelImpl) then) =
      __$$AllImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ImagesDataModel>? imagess,
      String? message,
      bool? success,
      int? total});
}

/// @nodoc
class __$$AllImageModelImplCopyWithImpl<$Res>
    extends _$AllImageModelCopyWithImpl<$Res, _$AllImageModelImpl>
    implements _$$AllImageModelImplCopyWith<$Res> {
  __$$AllImageModelImplCopyWithImpl(
      _$AllImageModelImpl _value, $Res Function(_$AllImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagess = freezed,
    Object? message = freezed,
    Object? success = freezed,
    Object? total = freezed,
  }) {
    return _then(_$AllImageModelImpl(
      imagess: freezed == imagess
          ? _value._imagess
          : imagess // ignore: cast_nullable_to_non_nullable
              as List<ImagesDataModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllImageModelImpl implements _AllImageModel {
  const _$AllImageModelImpl(
      {final List<ImagesDataModel>? imagess,
      this.message,
      this.success,
      this.total})
      : _imagess = imagess;

  factory _$AllImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllImageModelImplFromJson(json);

  final List<ImagesDataModel>? _imagess;
  @override
  List<ImagesDataModel>? get imagess {
    final value = _imagess;
    if (value == null) return null;
    if (_imagess is EqualUnmodifiableListView) return _imagess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;
  @override
  final bool? success;
  @override
  final int? total;

  @override
  String toString() {
    return 'AllImageModel(imagess: $imagess, message: $message, success: $success, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllImageModelImpl &&
            const DeepCollectionEquality().equals(other._imagess, _imagess) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_imagess), message, success, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllImageModelImplCopyWith<_$AllImageModelImpl> get copyWith =>
      __$$AllImageModelImplCopyWithImpl<_$AllImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllImageModelImplToJson(
      this,
    );
  }
}

abstract class _AllImageModel implements AllImageModel {
  const factory _AllImageModel(
      {final List<ImagesDataModel>? imagess,
      final String? message,
      final bool? success,
      final int? total}) = _$AllImageModelImpl;

  factory _AllImageModel.fromJson(Map<String, dynamic> json) =
      _$AllImageModelImpl.fromJson;

  @override
  List<ImagesDataModel>? get imagess;
  @override
  String? get message;
  @override
  bool? get success;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$AllImageModelImplCopyWith<_$AllImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImagesDataModel _$ImagesDataModelFromJson(Map<String, dynamic> json) {
  return _ImagesDataModel.fromJson(json);
}

/// @nodoc
mixin _$ImagesDataModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<String>? get image => throw _privateConstructorUsedError;
  CategoryDataModel? get category => throw _privateConstructorUsedError;
  SubCategoryDataModel? get subcategory => throw _privateConstructorUsedError;
  String? get imageType => throw _privateConstructorUsedError;
  int? get downloadCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesDataModelCopyWith<ImagesDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesDataModelCopyWith<$Res> {
  factory $ImagesDataModelCopyWith(
          ImagesDataModel value, $Res Function(ImagesDataModel) then) =
      _$ImagesDataModelCopyWithImpl<$Res, ImagesDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      List<String>? image,
      CategoryDataModel? category,
      SubCategoryDataModel? subcategory,
      String? imageType,
      int? downloadCount});

  $CategoryDataModelCopyWith<$Res>? get category;
  $SubCategoryDataModelCopyWith<$Res>? get subcategory;
}

/// @nodoc
class _$ImagesDataModelCopyWithImpl<$Res, $Val extends ImagesDataModel>
    implements $ImagesDataModelCopyWith<$Res> {
  _$ImagesDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? category = freezed,
    Object? subcategory = freezed,
    Object? imageType = freezed,
    Object? downloadCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDataModel?,
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as SubCategoryDataModel?,
      imageType: freezed == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadCount: freezed == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryDataModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryDataModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubCategoryDataModelCopyWith<$Res>? get subcategory {
    if (_value.subcategory == null) {
      return null;
    }

    return $SubCategoryDataModelCopyWith<$Res>(_value.subcategory!, (value) {
      return _then(_value.copyWith(subcategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImagesDataModelImplCopyWith<$Res>
    implements $ImagesDataModelCopyWith<$Res> {
  factory _$$ImagesDataModelImplCopyWith(_$ImagesDataModelImpl value,
          $Res Function(_$ImagesDataModelImpl) then) =
      __$$ImagesDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      List<String>? image,
      CategoryDataModel? category,
      SubCategoryDataModel? subcategory,
      String? imageType,
      int? downloadCount});

  @override
  $CategoryDataModelCopyWith<$Res>? get category;
  @override
  $SubCategoryDataModelCopyWith<$Res>? get subcategory;
}

/// @nodoc
class __$$ImagesDataModelImplCopyWithImpl<$Res>
    extends _$ImagesDataModelCopyWithImpl<$Res, _$ImagesDataModelImpl>
    implements _$$ImagesDataModelImplCopyWith<$Res> {
  __$$ImagesDataModelImplCopyWithImpl(
      _$ImagesDataModelImpl _value, $Res Function(_$ImagesDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? category = freezed,
    Object? subcategory = freezed,
    Object? imageType = freezed,
    Object? downloadCount = freezed,
  }) {
    return _then(_$ImagesDataModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDataModel?,
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as SubCategoryDataModel?,
      imageType: freezed == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadCount: freezed == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesDataModelImpl implements _ImagesDataModel {
  const _$ImagesDataModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.name,
      final List<String>? image,
      this.category,
      this.subcategory,
      this.imageType,
      this.downloadCount})
      : _image = image;

  factory _$ImagesDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesDataModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  final List<String>? _image;
  @override
  List<String>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CategoryDataModel? category;
  @override
  final SubCategoryDataModel? subcategory;
  @override
  final String? imageType;
  @override
  final int? downloadCount;

  @override
  String toString() {
    return 'ImagesDataModel(id: $id, name: $name, image: $image, category: $category, subcategory: $subcategory, imageType: $imageType, downloadCount: $downloadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.imageType, imageType) ||
                other.imageType == imageType) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_image),
      category,
      subcategory,
      imageType,
      downloadCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesDataModelImplCopyWith<_$ImagesDataModelImpl> get copyWith =>
      __$$ImagesDataModelImplCopyWithImpl<_$ImagesDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesDataModelImplToJson(
      this,
    );
  }
}

abstract class _ImagesDataModel implements ImagesDataModel {
  const factory _ImagesDataModel(
      {@JsonKey(name: '_id') final String? id,
      final String? name,
      final List<String>? image,
      final CategoryDataModel? category,
      final SubCategoryDataModel? subcategory,
      final String? imageType,
      final int? downloadCount}) = _$ImagesDataModelImpl;

  factory _ImagesDataModel.fromJson(Map<String, dynamic> json) =
      _$ImagesDataModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  List<String>? get image;
  @override
  CategoryDataModel? get category;
  @override
  SubCategoryDataModel? get subcategory;
  @override
  String? get imageType;
  @override
  int? get downloadCount;
  @override
  @JsonKey(ignore: true)
  _$$ImagesDataModelImplCopyWith<_$ImagesDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubCategoryDataModel _$SubCategoryDataModelFromJson(Map<String, dynamic> json) {
  return _SubCategoryDataModel.fromJson(json);
}

/// @nodoc
mixin _$SubCategoryDataModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get v => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryDataModelCopyWith<SubCategoryDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryDataModelCopyWith<$Res> {
  factory $SubCategoryDataModelCopyWith(SubCategoryDataModel value,
          $Res Function(SubCategoryDataModel) then) =
      _$SubCategoryDataModelCopyWithImpl<$Res, SubCategoryDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? image,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? v,
      String? category});
}

/// @nodoc
class _$SubCategoryDataModelCopyWithImpl<$Res,
        $Val extends SubCategoryDataModel>
    implements $SubCategoryDataModelCopyWith<$Res> {
  _$SubCategoryDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubCategoryDataModelImplCopyWith<$Res>
    implements $SubCategoryDataModelCopyWith<$Res> {
  factory _$$SubCategoryDataModelImplCopyWith(_$SubCategoryDataModelImpl value,
          $Res Function(_$SubCategoryDataModelImpl) then) =
      __$$SubCategoryDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? image,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? v,
      String? category});
}

/// @nodoc
class __$$SubCategoryDataModelImplCopyWithImpl<$Res>
    extends _$SubCategoryDataModelCopyWithImpl<$Res, _$SubCategoryDataModelImpl>
    implements _$$SubCategoryDataModelImplCopyWith<$Res> {
  __$$SubCategoryDataModelImplCopyWithImpl(_$SubCategoryDataModelImpl _value,
      $Res Function(_$SubCategoryDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? category = freezed,
  }) {
    return _then(_$SubCategoryDataModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubCategoryDataModelImpl implements _SubCategoryDataModel {
  const _$SubCategoryDataModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.category});

  factory _$SubCategoryDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCategoryDataModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;
  @override
  final String? category;

  @override
  String toString() {
    return 'SubCategoryDataModel(id: $id, name: $name, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, image, createdAt, updatedAt, v, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryDataModelImplCopyWith<_$SubCategoryDataModelImpl>
      get copyWith =>
          __$$SubCategoryDataModelImplCopyWithImpl<_$SubCategoryDataModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubCategoryDataModelImplToJson(
      this,
    );
  }
}

abstract class _SubCategoryDataModel implements SubCategoryDataModel {
  const factory _SubCategoryDataModel(
      {@JsonKey(name: '_id') final String? id,
      final String? name,
      final String? image,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final int? v,
      final String? category}) = _$SubCategoryDataModelImpl;

  factory _SubCategoryDataModel.fromJson(Map<String, dynamic> json) =
      _$SubCategoryDataModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  int? get v;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$SubCategoryDataModelImplCopyWith<_$SubCategoryDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
