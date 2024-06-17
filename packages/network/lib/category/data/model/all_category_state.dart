import 'package:freezed_annotation/freezed_annotation.dart';

import 'all_category_model.dart';
part 'all_category_state.freezed.dart';
@freezed
class AllCategoryState with _$AllCategoryState {
  factory AllCategoryState({
    @Default(AllCategoryModel()) AllCategoryModel allCategory,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingMore,
  }) = _AllCategoryState;
}
