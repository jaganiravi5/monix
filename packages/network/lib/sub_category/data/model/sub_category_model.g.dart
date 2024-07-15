// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubCategoryModelImpl _$$SubCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubCategoryModelImpl(
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$SubCategoryModelImplToJson(
        _$SubCategoryModelImpl instance) =>
    <String, dynamic>{
      'subcategory': instance.subcategory,
      'message': instance.message,
      'success': instance.success,
    };

_$SubCategoryDataImpl _$$SubCategoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SubCategoryDataImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      category: json['category'] == null
          ? null
          : CategoryDataModel.fromJson(
              json['category'] as Map<String, dynamic>),
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SubCategoryDataImplToJson(
        _$SubCategoryDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'image': instance.image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
    };
