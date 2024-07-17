import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/suggestion/data/model/suggestion_state.dart';
import 'package:network/suggestion/data/repository/suggestion_repository.dart';

class SuggestionDataNotifier extends StateNotifier<SuggestionState> {
  SuggestionDataNotifier(this.suggestionRepository) : super(SuggestionState());

  SuggestionRepository suggestionRepository;

  Future<void> submitSuggestion({
    required Map<String, dynamic> body,
  }) async {
    state = state.copyWith(isLoading: true);

    await suggestionRepository.suggestionRepo(body: body).then(
      (data) {
        state = state.copyWith(
            suggestion: data, isLoading: false, isLoadingMore: false);
      },
    ).onError(
      (error, stackTrace) {},
    );
  }
}
