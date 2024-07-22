// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchModelImpl _$$SearchModelImplFromJson(Map<String, dynamic> json) =>
    _$SearchModelImpl(
      data: json['data'] == null
          ? null
          : SearchData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$SearchModelImplToJson(_$SearchModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };

_$SearchDataImpl _$$SearchDataImplFromJson(Map<String, dynamic> json) =>
    _$SearchDataImpl(
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => CategoryDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubCatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchDataImplToJson(_$SearchDataImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'subcategory': instance.subcategory,
    };

_$SubCatDataImpl _$$SubCatDataImplFromJson(Map<String, dynamic> json) =>
    _$SubCatDataImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SubCatDataImplToJson(_$SubCatDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'image': instance.image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
    };
