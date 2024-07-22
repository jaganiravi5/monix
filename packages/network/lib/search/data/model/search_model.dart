import 'package:common/models/mobile_models/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/category/data/model/all_category_model.dart';
import 'package:network/sub_category/data/model/sub_category_model.dart';
part 'search_model.freezed.dart';

part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
    const factory SearchModel({
        SearchData? data,
        String? message,
        bool? success,
    }) = _SearchModel;
      factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);
}

@freezed
class SearchData with _$SearchData {
    const factory SearchData({
        List<CategoryDataModel>? category,
        List<SubCatData>? subcategory,
    }) = _SearchData;
      factory SearchData.fromJson(Map<String, dynamic> json) => _$SearchDataFromJson(json);
}

@freezed
class SubCatData with _$SubCatData {
    const factory SubCatData({
       @JsonKey(name: '_id')
        String? id,
        String? name,
        String? category,
        String? image,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) = _SubCatData;

     factory SubCatData.fromJson(Map<String, dynamic> json) => _$SubCatDataFromJson(json);
}