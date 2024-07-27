import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/ads/data/model/ads_model.dart';

part 'ads_state.freezed.dart';
@freezed
class AdsState with _$AdsState {
  factory AdsState({
    @Default(AdsModel()) AdsModel adsModel,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingMore,
  }) = _AdsState;
}
