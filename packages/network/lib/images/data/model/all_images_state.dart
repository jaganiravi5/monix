import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/images/data/model/all_images_model.dart';
part 'all_images_state.freezed.dart';
@freezed
class AllImagesState with _$AllImagesState {
  factory AllImagesState({
    @Default(AllImageModel()) AllImageModel allImages,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingMore,
  }) = _AllImagesState;
}
