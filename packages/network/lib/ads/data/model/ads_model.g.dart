// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdsModelImpl _$$AdsModelImplFromJson(Map<String, dynamic> json) =>
    _$AdsModelImpl(
      isShowAd: json['is_show_ad'] as bool?,
      instagramUrl: json['instagram_url'] as String?,
      ytUrl: json['youtube_url'] as String?,
      wpUrl: json['wp_url'] as String?,
      interAndroidSkipBtn: json['inter_android_skip_btn'] as String?,
      interIosSkipBtn: json['inter_ios_skip_btn'] as String?,
      downloadImageRewardBtn:
          json['download_image_reward_android_btn'] as String?,
    );

Map<String, dynamic> _$$AdsModelImplToJson(_$AdsModelImpl instance) =>
    <String, dynamic>{
      'is_show_ad': instance.isShowAd,
      'instagram_url': instance.instagramUrl,
      'youtube_url': instance.ytUrl,
      'wp_url': instance.wpUrl,
      'inter_android_skip_btn': instance.interAndroidSkipBtn,
      'inter_ios_skip_btn': instance.interIosSkipBtn,
      'download_image_reward_android_btn': instance.downloadImageRewardBtn,
    };
