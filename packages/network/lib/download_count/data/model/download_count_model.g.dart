// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadCountModelImpl _$$DownloadCountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DownloadCountModelImpl(
      message: json['message'] as String?,
      downloadCount: (json['downloadCount'] as num?)?.toInt(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$DownloadCountModelImplToJson(
        _$DownloadCountModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'downloadCount': instance.downloadCount,
      'success': instance.success,
    };
