import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/core/shared_provider/shared_providers.dart';
import 'package:network/images/data/api/all_images_api.dart';
import 'package:network/images/data/model/all_images_state.dart';
import 'package:network/images/data/repository/all_images_repository.dart';
import 'package:network/images/provider/provider.dart';

final allImagesApiProvider = Provider<AllImagesApi>((ref) {
  return AllImagesApi(
    ref.read(dioClientProvider),
  );
});

final allImagesRepositoryProvider = Provider<AllImagesRepository>((ref) {
  return AllImagesRepository(
    ref.read(allImagesApiProvider),
  );
});

final allImagesDataProvider = StateNotifierProvider<AllImagesDataNotifier, AllImagesState>((ref) {
  return AllImagesDataNotifier(
    ref.read(allImagesRepositoryProvider),
  );
});
