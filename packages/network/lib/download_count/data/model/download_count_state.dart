import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/download_count/data/model/download_count_model.dart';
import 'package:network/images/data/model/all_images_model.dart';
part 'download_count_state.freezed.dart';
@freezed
class DownloadCountState with _$DownloadCountState {
  factory DownloadCountState({
    @Default(DownloadCountModel()) DownloadCountModel downloadCountModel,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingMore,
  }) = _DownloadCountState;
}
