// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllImageModelImpl _$$AllImageModelImplFromJson(Map<String, dynamic> json) =>
    _$AllImageModelImpl(
      imagess: (json['imagess'] as List<dynamic>?)
          ?.map((e) => ImagesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      success: json['success'] as bool?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AllImageModelImplToJson(_$AllImageModelImpl instance) =>
    <String, dynamic>{
      'imagess': instance.imagess,
      'message': instance.message,
      'success': instance.success,
      'total': instance.total,
    };

_$ImagesDataModelImpl _$$ImagesDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImagesDataModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] == null
          ? null
          : CategoryDataModel.fromJson(
              json['category'] as Map<String, dynamic>),
      subcategory: json['subcategory'] == null
          ? null
          : SubCategoryDataModel.fromJson(
              json['subcategory'] as Map<String, dynamic>),
      imageType: json['imageType'] as String?,
      downloadCount: (json['downloadCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ImagesDataModelImplToJson(
        _$ImagesDataModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'imageType': instance.imageType,
      'downloadCount': instance.downloadCount,
    };

_$SubCategoryDataModelImpl _$$SubCategoryDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubCategoryDataModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['v'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$SubCategoryDataModelImplToJson(
        _$SubCategoryDataModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
      'category': instance.category,
    };
