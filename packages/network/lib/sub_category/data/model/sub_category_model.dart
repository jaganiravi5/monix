import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/category/data/model/all_category_model.dart';

part 'sub_category_model.freezed.dart';

part 'sub_category_model.g.dart';
@freezed
class SubCategoryModel with _$SubCategoryModel {
    const factory SubCategoryModel({
        List<SubCategoryData>? subcategory,
        String? message,
        bool? success,
    }) = _SubCategoryModel;

     factory SubCategoryModel.fromJson(Map<String, dynamic> json) => _$SubCategoryModelFromJson(json);
}

@freezed
class SubCategoryData with _$SubCategoryData {
    const factory SubCategoryData({
       @JsonKey(name: '_id')
        String? id,
        String? name,
        CategoryDataModel? category,
        String? image,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) = _SubCategoryData;

     factory SubCategoryData.fromJson(Map<String, dynamic> json) => _$SubCategoryDataFromJson(json);
}
