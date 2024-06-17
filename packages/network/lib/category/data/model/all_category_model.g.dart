// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllCategoryModelImpl _$$AllCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllCategoryModelImpl(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$AllCategoryModelImplToJson(
        _$AllCategoryModelImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'message': instance.message,
      'success': instance.success,
    };

_$CategoryDataModelImpl _$$CategoryDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryDataModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['v'] as int?,
    );

Map<String, dynamic> _$$CategoryDataModelImplToJson(
        _$CategoryDataModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
    };
