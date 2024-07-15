// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionModelImpl _$$SuggestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestionModelImpl(
      name: json['name'] as String?,
      suggestion: json['suggestion'] as String?,
      id: json['_id'] as String?,
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SuggestionModelImplToJson(
        _$SuggestionModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'suggestion': instance.suggestion,
      '_id': instance.id,
      'v': instance.v,
    };
