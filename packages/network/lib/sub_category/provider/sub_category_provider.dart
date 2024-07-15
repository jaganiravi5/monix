import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/category/data/api/all_category_api.dart';

import 'package:network/core/shared_provider/shared_providers.dart';
import 'package:network/sub_category/data/api/sub_category_api.dart';

import '../data/model/sub_category_state.dart';
import '../data/repository/sub_category_repository.dart';
import 'sub_category_state_provider.dart';

final subCategoryApiProvider = Provider<SubCategoryApi>(
      (ref) {
    return SubCategoryApi(
      ref.read(dioClientProvider),
    );
  },
);

final subCategoryRepositoryProvider = Provider<SubCategoryRepository>((ref) {
  return SubCategoryRepository(
    ref.read(subCategoryApiProvider),
  );
});

final subCategoryDataProvider = StateNotifierProvider<SubCategoryDataNotifier, SubCategoryState>((ref) {
  return SubCategoryDataNotifier(
    ref.read(subCategoryRepositoryProvider),
  );
});
