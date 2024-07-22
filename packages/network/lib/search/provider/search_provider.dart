import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/core/shared_provider/shared_providers.dart';
import 'package:network/images/data/api/all_images_api.dart';
import 'package:network/images/data/model/all_images_state.dart';
import 'package:network/images/data/repository/all_images_repository.dart';
import 'package:network/images/provider/provider.dart';
import 'package:network/search/data/api/search_api.dart';
import 'package:network/search/data/model/search_state.dart';
import 'package:network/search/data/repository/search_repository.dart';
import 'package:network/search/provider/search_state_provider.dart';

final searchApiProvider = Provider<SearchApi>((ref) {
  return SearchApi(
    ref.read(dioClientProvider),
  );
});

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository(
    ref.read(searchApiProvider),
  );
});

final searchDataProvider = StateNotifierProvider<SearchDataNotifier, SearchState>((ref) {
  return SearchDataNotifier(
    ref.read(searchRepositoryProvider),
  );
});
