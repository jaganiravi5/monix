// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllCategoryModel _$AllCategoryModelFromJson(Map<String, dynamic> json) {
  return _AllCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$AllCategoryModel {
  List<CategoryDataModel>? get categories => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllCategoryModelCopyWith<AllCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCategoryModelCopyWith<$Res> {
  factory $AllCategoryModelCopyWith(
          AllCategoryModel value, $Res Function(AllCategoryModel) then) =
      _$AllCategoryModelCopyWithImpl<$Res, AllCategoryModel>;
  @useResult
  $Res call(
      {List<CategoryDataModel>? categories, String? message, bool? success});
}

/// @nodoc
class _$AllCategoryModelCopyWithImpl<$Res, $Val extends AllCategoryModel>
    implements $AllCategoryModelCopyWith<$Res> {
  _$AllCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDataModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllCategoryModelImplCopyWith<$Res>
    implements $AllCategoryModelCopyWith<$Res> {
  factory _$$AllCategoryModelImplCopyWith(_$AllCategoryModelImpl value,
          $Res Function(_$AllCategoryModelImpl) then) =
      __$$AllCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryDataModel>? categories, String? message, bool? success});
}

/// @nodoc
class __$$AllCategoryModelImplCopyWithImpl<$Res>
    extends _$AllCategoryModelCopyWithImpl<$Res, _$AllCategoryModelImpl>
    implements _$$AllCategoryModelImplCopyWith<$Res> {
  __$$AllCategoryModelImplCopyWithImpl(_$AllCategoryModelImpl _value,
      $Res Function(_$AllCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$AllCategoryModelImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDataModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllCategoryModelImpl implements _AllCategoryModel {
  const _$AllCategoryModelImpl(
      {final List<CategoryDataModel>? categories, this.message, this.success})
      : _categories = categories;

  factory _$AllCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllCategoryModelImplFromJson(json);

  final List<CategoryDataModel>? _categories;
  @override
  List<CategoryDataModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'AllCategoryModel(categories: $categories, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllCategoryModelImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_categories), message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllCategoryModelImplCopyWith<_$AllCategoryModelImpl> get copyWith =>
      __$$AllCategoryModelImplCopyWithImpl<_$AllCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _AllCategoryModel implements AllCategoryModel {
  const factory _AllCategoryModel(
      {final List<CategoryDataModel>? categories,
      final String? message,
      final bool? success}) = _$AllCategoryModelImpl;

  factory _AllCategoryModel.fromJson(Map<String, dynamic> json) =
      _$AllCategoryModelImpl.fromJson;

  @override
  List<CategoryDataModel>? get categories;
  @override
  String? get message;
  @override
  bool? get success;
  @override
  @JsonKey(ignore: true)
  _$$AllCategoryModelImplCopyWith<_$AllCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryDataModel _$CategoryDataModelFromJson(Map<String, dynamic> json) {
  return _CategoryDataModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryDataModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDataModelCopyWith<CategoryDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataModelCopyWith<$Res> {
  factory $CategoryDataModelCopyWith(
          CategoryDataModel value, $Res Function(CategoryDataModel) then) =
      _$CategoryDataModelCopyWithImpl<$Res, CategoryDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? image,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? v});
}

/// @nodoc
class _$CategoryDataModelCopyWithImpl<$Res, $Val extends CategoryDataModel>
    implements $CategoryDataModelCopyWith<$Res> {
  _$CategoryDataModelCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDataModelImplCopyWith<$Res>
    implements $CategoryDataModelCopyWith<$Res> {
  factory _$$CategoryDataModelImplCopyWith(_$CategoryDataModelImpl value,
          $Res Function(_$CategoryDataModelImpl) then) =
      __$$CategoryDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? image,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? v});
}

/// @nodoc
class __$$CategoryDataModelImplCopyWithImpl<$Res>
    extends _$CategoryDataModelCopyWithImpl<$Res, _$CategoryDataModelImpl>
    implements _$$CategoryDataModelImplCopyWith<$Res> {
  __$$CategoryDataModelImplCopyWithImpl(_$CategoryDataModelImpl _value,
      $Res Function(_$CategoryDataModelImpl) _then)
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
  }) {
    return _then(_$CategoryDataModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDataModelImpl implements _CategoryDataModel {
  const _$CategoryDataModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory _$CategoryDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDataModelImplFromJson(json);

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
  String toString() {
    return 'CategoryDataModel(id: $id, name: $name, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, createdAt, updatedAt, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataModelImplCopyWith<_$CategoryDataModelImpl> get copyWith =>
      __$$CategoryDataModelImplCopyWithImpl<_$CategoryDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDataModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryDataModel implements CategoryDataModel {
  const factory _CategoryDataModel(
      {@JsonKey(name: '_id') final String? id,
      final String? name,
      final String? image,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final int? v}) = _$CategoryDataModelImpl;

  factory _CategoryDataModel.fromJson(Map<String, dynamic> json) =
      _$CategoryDataModelImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$CategoryDataModelImplCopyWith<_$CategoryDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
