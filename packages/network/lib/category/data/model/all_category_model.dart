import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_category_model.freezed.dart';

part 'all_category_model.g.dart';

@freezed
class AllCategoryModel with _$AllCategoryModel {
  const factory AllCategoryModel({
    List<CategoryDataModel>? categories,
    String? message,
    bool? success,
  }) = _AllCategoryModel;

  factory AllCategoryModel.fromJson(Map<String, dynamic> json) => _$AllCategoryModelFromJson(json);
}

@freezed
class CategoryDataModel with _$CategoryDataModel {
  const factory CategoryDataModel({
    @JsonKey(name: '_id')
    String? id,
    String? name,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) = _CategoryDataModel;

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) => _$CategoryDataModelFromJson(json);
}
