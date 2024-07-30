import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/download_count/data/model/download_count_state.dart';
import 'package:network/download_count/data/repository/download_count_repository.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/images/data/model/all_images_state.dart';
import 'package:network/images/data/repository/all_images_repository.dart';

class DownloadCountDataNotifier extends StateNotifier<DownloadCountState> {
  DownloadCountDataNotifier(this.downloadCountRepository)
      : super(DownloadCountState());

  DownloadCountRepository downloadCountRepository;

  // int page = 1;
  // int limit = 18;
  List<ImagesDataModel> listAllImages = [];
  List<ImagesDataModel> listAllSearchData = [];
  bool isPagination = true;

  Future<void> downloadCount({
    required String imgId,
  }) async {
    state = state.copyWith(isLoading: true);

    await downloadCountRepository.downloadCountRepo(imageId: imgId).then(
      (data) {
        print("${data.downloadCount}");
        state = state.copyWith(
            downloadCountModel: data, isLoading: false, isLoadingMore: false);
      },
    ).onError(
      (error, stackTrace) {},
    );
  }
}

final pageProvider = StateProvider<int>((ref) => 1);
final pageSizeProvider = StateProvider<int>((ref) => 18);
