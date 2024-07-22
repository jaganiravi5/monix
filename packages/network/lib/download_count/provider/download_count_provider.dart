import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/core/shared_provider/shared_providers.dart';
import 'package:network/download_count/data/api/download_count_api.dart';
import 'package:network/download_count/data/model/download_count_state.dart';
import 'package:network/download_count/data/repository/download_count_repository.dart';
import 'package:network/download_count/provider/download_count_state_provider.dart';

final downloadCountApiProvider = Provider<DownloadCountApi>((ref) {
  return DownloadCountApi(
    ref.read(dioClientProvider),
  );
});

final downloadCountRepositoryProvider = Provider<DownloadCountRepository>((ref) {
  return DownloadCountRepository(
    ref.read(downloadCountApiProvider),
  );
});

final downloadCountDataProvider = StateNotifierProvider<DownloadCountDataNotifier, DownloadCountState>((ref) {
  return DownloadCountDataNotifier(
    ref.read(downloadCountRepositoryProvider),
  );
});
