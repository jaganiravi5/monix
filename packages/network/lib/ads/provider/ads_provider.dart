import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/ads/data/api/ads_api.dart';
import 'package:network/ads/data/model/ads_state.dart';
import 'package:network/ads/data/repository/ads_repository.dart';
import 'package:network/ads/provider/provider.dart';
import 'package:network/category/data/api/all_category_api.dart';

import 'package:network/core/shared_provider/shared_providers.dart';


final adsApiProvider = Provider<AdsApi>(
      (ref) {
    return AdsApi(
      ref.read(dioClientProvider),
    );
  },
);

final adsRepositoryProvider = Provider<AdsRepository>((ref) {
  return AdsRepository(
    ref.read(adsApiProvider),
  );
});

final adsDataProvider = StateNotifierProvider<AdsDataNotifier, AdsState>((ref) {
  return AdsDataNotifier(
    ref.read(adsRepositoryProvider),
  );
});
