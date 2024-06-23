import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/category/data/model/all_category_model.dart';
part 'all_images_model.freezed.dart';

part 'all_images_model.g.dart';

@freezed
class AllImageModel with _$AllImageModel {
    const factory AllImageModel({
        List<ImagesDataModel>? imagess,
        String? message,
        bool? success,
        int? total,
    }) = _AllImageModel;
    factory AllImageModel.fromJson(Map<String, dynamic> json) => _$AllImageModelFromJson(json);
}

@freezed
class ImagesDataModel with _$ImagesDataModel{
    const factory ImagesDataModel({
      @JsonKey(name: '_id')
        String? id,
        String? name,
        List<String>? image,
        CategoryDataModel? category,
        SubCategoryDataModel? subcategory,
        String? imageType,
        int? downloadCount,
    }) = _ImagesDataModel;
     factory ImagesDataModel.fromJson(Map<String, dynamic> json) => _$ImagesDataModelFromJson(json);
}

@freezed
class SubCategoryDataModel with _$SubCategoryDataModel {
    const factory SubCategoryDataModel({
      @JsonKey(name: '_id')
        String? id,
        String? name,
        String? image,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
        String? category,
    }) = _SubCategoryDataModel;
    factory SubCategoryDataModel.fromJson(Map<String, dynamic> json) => _$SubCategoryDataModelFromJson(json);
}
