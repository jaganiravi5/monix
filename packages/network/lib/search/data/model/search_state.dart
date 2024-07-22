import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/search/data/model/search_model.dart';
part 'search_state.freezed.dart';
@freezed
class SearchState with _$SearchState {
  factory SearchState({
    @Default(SearchModel()) SearchModel searchModel,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingMore,
  }) = _SearchState;
}
