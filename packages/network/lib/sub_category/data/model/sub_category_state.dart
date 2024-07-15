import 'package:freezed_annotation/freezed_annotation.dart';

import 'sub_category_model.dart';
part 'sub_category_state.freezed.dart';
@freezed
class SubCategoryState with _$SubCategoryState {
  factory SubCategoryState({
    @Default(SubCategoryModel()) SubCategoryModel subCategory,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingMore,
  }) = _SubCategoryState;
}
