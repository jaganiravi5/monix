// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) {
  return _SubCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$SubCategoryModel {
  List<SubCategoryData>? get subcategory => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryModelCopyWith<SubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryModelCopyWith<$Res> {
  factory $SubCategoryModelCopyWith(
          SubCategoryModel value, $Res Function(SubCategoryModel) then) =
      _$SubCategoryModelCopyWithImpl<$Res, SubCategoryModel>;
  @useResult
  $Res call(
      {List<SubCategoryData>? subcategory, String? message, bool? success});
}

/// @nodoc
class _$SubCategoryModelCopyWithImpl<$Res, $Val extends SubCategoryModel>
    implements $SubCategoryModelCopyWith<$Res> {
  _$SubCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcategory = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryData>?,
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
abstract class _$$SubCategoryModelImplCopyWith<$Res>
    implements $SubCategoryModelCopyWith<$Res> {
  factory _$$SubCategoryModelImplCopyWith(_$SubCategoryModelImpl value,
          $Res Function(_$SubCategoryModelImpl) then) =
      __$$SubCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SubCategoryData>? subcategory, String? message, bool? success});
}

/// @nodoc
class __$$SubCategoryModelImplCopyWithImpl<$Res>
    extends _$SubCategoryModelCopyWithImpl<$Res, _$SubCategoryModelImpl>
    implements _$$SubCategoryModelImplCopyWith<$Res> {
  __$$SubCategoryModelImplCopyWithImpl(_$SubCategoryModelImpl _value,
      $Res Function(_$SubCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcategory = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$SubCategoryModelImpl(
      subcategory: freezed == subcategory
          ? _value._subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryData>?,
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
class _$SubCategoryModelImpl implements _SubCategoryModel {
  const _$SubCategoryModelImpl(
      {final List<SubCategoryData>? subcategory, this.message, this.success})
      : _subcategory = subcategory;

  factory _$SubCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCategoryModelImplFromJson(json);

  final List<SubCategoryData>? _subcategory;
  @override
  List<SubCategoryData>? get subcategory {
    final value = _subcategory;
    if (value == null) return null;
    if (_subcategory is EqualUnmodifiableListView) return _subcategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'SubCategoryModel(subcategory: $subcategory, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryModelImpl &&
            const DeepCollectionEquality()
                .equals(other._subcategory, _subcategory) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_subcategory), message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryModelImplCopyWith<_$SubCategoryModelImpl> get copyWith =>
      __$$SubCategoryModelImplCopyWithImpl<_$SubCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _SubCategoryModel implements SubCategoryModel {
  const factory _SubCategoryModel(
      {final List<SubCategoryData>? subcategory,
      final String? message,
      final bool? success}) = _$SubCategoryModelImpl;

  factory _SubCategoryModel.fromJson(Map<String, dynamic> json) =
      _$SubCategoryModelImpl.fromJson;

  @override
  List<SubCategoryData>? get subcategory;
  @override
  String? get message;
  @override
  bool? get success;
  @override
  @JsonKey(ignore: true)
  _$$SubCategoryModelImplCopyWith<_$SubCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubCategoryData _$SubCategoryDataFromJson(Map<String, dynamic> json) {
  return _SubCategoryData.fromJson(json);
}

/// @nodoc
mixin _$SubCategoryData {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  CategoryDataModel? get category => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryDataCopyWith<SubCategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryDataCopyWith<$Res> {
  factory $SubCategoryDataCopyWith(
          SubCategoryData value, $Res Function(SubCategoryData) then) =
      _$SubCategoryDataCopyWithImpl<$Res, SubCategoryData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      CategoryDataModel? category,
      String? image,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? v});

  $CategoryDataModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$SubCategoryDataCopyWithImpl<$Res, $Val extends SubCategoryData>
    implements $SubCategoryDataCopyWith<$Res> {
  _$SubCategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDataModel?,
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
}

/// @nodoc
abstract class _$$SubCategoryDataImplCopyWith<$Res>
    implements $SubCategoryDataCopyWith<$Res> {
  factory _$$SubCategoryDataImplCopyWith(_$SubCategoryDataImpl value,
          $Res Function(_$SubCategoryDataImpl) then) =
      __$$SubCategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      CategoryDataModel? category,
      String? image,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? v});

  @override
  $CategoryDataModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$SubCategoryDataImplCopyWithImpl<$Res>
    extends _$SubCategoryDataCopyWithImpl<$Res, _$SubCategoryDataImpl>
    implements _$$SubCategoryDataImplCopyWith<$Res> {
  __$$SubCategoryDataImplCopyWithImpl(
      _$SubCategoryDataImpl _value, $Res Function(_$SubCategoryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$SubCategoryDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDataModel?,
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
class _$SubCategoryDataImpl implements _SubCategoryData {
  const _$SubCategoryDataImpl(
      {@JsonKey(name: '_id') this.id,
      this.name,
      this.category,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory _$SubCategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCategoryDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final CategoryDataModel? category;
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
    return 'SubCategoryData(id: $id, name: $name, category: $category, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, category, image, createdAt, updatedAt, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryDataImplCopyWith<_$SubCategoryDataImpl> get copyWith =>
      __$$SubCategoryDataImplCopyWithImpl<_$SubCategoryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubCategoryDataImplToJson(
      this,
    );
  }
}

abstract class _SubCategoryData implements SubCategoryData {
  const factory _SubCategoryData(
      {@JsonKey(name: '_id') final String? id,
      final String? name,
      final CategoryDataModel? category,
      final String? image,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final int? v}) = _$SubCategoryDataImpl;

  factory _SubCategoryData.fromJson(Map<String, dynamic> json) =
      _$SubCategoryDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  CategoryDataModel? get category;
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
  _$$SubCategoryDataImplCopyWith<_$SubCategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
