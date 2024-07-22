import 'package:freezed_annotation/freezed_annotation.dart';
part 'download_count_model.freezed.dart';

part 'download_count_model.g.dart';
@freezed
class DownloadCountModel with _$DownloadCountModel {
    const factory DownloadCountModel({
        String? message,
        int? downloadCount,
        bool? success,
    }) = _DownloadCountModel;
    factory DownloadCountModel.fromJson(Map<String, dynamic> json) => _$DownloadCountModelFromJson(json);
}
