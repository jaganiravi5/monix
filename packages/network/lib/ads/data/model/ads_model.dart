// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_model.freezed.dart';

part 'ads_model.g.dart';

@freezed
class AdsModel with _$AdsModel {
  const factory AdsModel({
    @JsonKey(name: 'is_show_ad') bool? isShowAd, 
    @JsonKey(name: 'instagram_url') String? instagramUrl,
    @JsonKey(name: 'youtube_url') String? ytUrl,
    @JsonKey(name: 'wp_url') String? wpUrl,
    @JsonKey(name: 'inter_android_skip_btn') String? interAndroidSkipBtn,
    @JsonKey(name: 'inter_ios_skip_btn') String? interIosSkipBtn,
    @JsonKey(name: 'download_image_reward_android_btn') String? downloadImageRewardBtn,
  }) = _AdsModel;

  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);
}
