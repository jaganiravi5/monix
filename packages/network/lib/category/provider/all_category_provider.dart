import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/category/data/api/all_category_api.dart';

import 'package:network/core/shared_provider/shared_providers.dart';

import '../data/model/all_category_state.dart';
import '../data/repository/all_category_repository.dart';
import 'all_category_state_provider.dart';

final allCategoryApiProvider = Provider<AllCategoryApi>(
      (ref) {
    return AllCategoryApi(
      ref.read(dioClientProvider),
    );
  },
);

final allCategoryRepositoryProvider = Provider<AllCategoryRepository>((ref) {
  return AllCategoryRepository(
    ref.read(allCategoryApiProvider),
  );
});

final allCategoryDataProvider = StateNotifierProvider<AllCategoryDataNotifier, AllCategoryState>((ref) {
  return AllCategoryDataNotifier(
    ref.read(allCategoryRepositoryProvider),
  );
});
