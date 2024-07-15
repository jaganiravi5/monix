import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/suggestion/data/model/suggestion_model.dart';

part 'suggestion_state.freezed.dart';
@freezed
class SuggestionState with _$SuggestionState {
  factory SuggestionState({
    @Default(SuggestionModel()) SuggestionModel suggestion,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingMore,
  }) = _SuggestionState;
}
