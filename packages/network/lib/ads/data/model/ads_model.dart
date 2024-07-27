import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_model.freezed.dart';

part 'ads_model.g.dart';

@freezed
class AdsModel with _$AdsModel {
  const factory AdsModel({
   
 String? message,
  
  }) = _AdsModel;

  factory AdsModel.fromJson(Map<String, dynamic> json) => _$AdsModelFromJson(json);
}
