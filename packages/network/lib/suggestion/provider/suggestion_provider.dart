import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/category/data/api/all_category_api.dart';

import 'package:network/core/shared_provider/shared_providers.dart';
import 'package:network/sub_category/data/api/sub_category_api.dart';
import 'package:network/suggestion/data/api/suggestion_api.dart';
import 'package:network/suggestion/data/model/suggestion_state.dart';
import 'package:network/suggestion/data/repository/suggestion_repository.dart';
import 'package:network/suggestion/provider/suggestion_state_provider.dart';

final suggestionApiProvider = Provider<SuggestionApi>(
      (ref) {
    return SuggestionApi(
      ref.read(dioClientProvider),
    );
  },
);

final suggestionRepositoryProvider = Provider<SuggestionRepository>((ref) {
  return SuggestionRepository(
    ref.read(suggestionApiProvider),
  );
});

final suggestionDataProvider = StateNotifierProvider<SuggestionDataNotifier, SuggestionState>((ref) {
  return SuggestionDataNotifier(
    ref.read(suggestionRepositoryProvider),
  );
});
