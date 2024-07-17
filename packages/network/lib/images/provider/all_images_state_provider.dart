import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/images/data/model/all_images_state.dart';
import 'package:network/images/data/repository/all_images_repository.dart';

class AllImagesDataNotifier extends StateNotifier<AllImagesState> {
  AllImagesDataNotifier(this.allImagesRepository) : super(AllImagesState());

  AllImagesRepository allImagesRepository;

  int page = 1;
  int limit = 18;
  List<ImagesDataModel> listAllImages = [];
  List<ImagesDataModel> listAllSearchData = [];
  bool isPagination = true;

  Future<void> allImages({
    required bool isSearch,
    bool? isTrending,
    required String type,
    String? subCateId,
    String? searchText,
  }) async {
    state = state.copyWith(isLoading: true);

    await allImagesRepository
        .allImagesRepo(
      queryParams: isSearch
          ? {
              'page': page,
              'limit': limit,
              // 'type': type,
              'search': searchText,
            }
          : subCateId != null && subCateId.isNotEmpty
              ? {
                  'page': page,
                  'limit': limit,
                  'type': type,
                  'subcategory': subCateId
                }
              : isTrending != null && isTrending
                  ? {
                      'page': page,
                      'limit': limit,
                      'type': type,
                      'trending': isTrending
                    }
                  : {
                      'page': page,
                      'limit': limit,
                      'type': type,
                    },
    )
        .then(
      (data) {
        if (isSearch) {
          listAllSearchData.clear();
          listAllSearchData.addAll(data.imagess!);
        } else {
          listAllImages.clear();
          listAllImages.addAll(data.imagess!);
        }

        print('LoadingData $page ${listAllImages.length}');
        state = state.copyWith(
            allImages: data, isLoading: false, isLoadingMore: false);
      },
    ).onError(
      (error, stackTrace) {},
    );
  }

  List<ImagesDataModel> getAllImages() {
    return listAllImages;
  }

  List<ImagesDataModel> getSearchsubCat() {
    Set<String> subCategorySet = {};
    List<ImagesDataModel> uniqueImagesList = [];
    for (var image in listAllSearchData) {
      if (!subCategorySet.contains(image.subcategory?.name)) {
        subCategorySet.add(image.subcategory?.name??'');
        uniqueImagesList.add(image);
      }
    }

    return uniqueImagesList;
  }

  // void updateCustomer({required int index, required AllCustomerData customerData}) {
  //   listAllImages[index] = customerData;
  // }

  // void removeItem({required int index}) {
  //   listAllData.remove(index);
  // }

  // void addCustomer({required AllCustomerData customerData}) {
  //   listAllImages.add(customerData);
  // }

  Future<void> fetchNextBatch({
    String? jwtToken,
    required Map<String, int> queryParams,
  }) async {
    page++;
    print('PageNo $page ${listAllImages.length}');

    state = state.copyWith(isLoading: false, isLoadingMore: true);

    await allImagesRepository.allImagesRepo(
      queryParams: {
        "pagination[page]": page,
        "pagination[pageSize]": limit,
        "sort[0]": "business_name:asc",
        "sort[1]": "first_name:asc",
      },
      // jwtToken: jwtToken,
    ).then(
      (data) {
        if (data.imagess!.length < limit) {
          isPagination = false;
        }
        state = state.copyWith(isLoading: false, isLoadingMore: false);
        listAllImages.addAll(data.imagess!);
        print('LoadingData:::::::IMG $page ${listAllImages.length}');
        state = state.copyWith(
          allImages: data,
          isLoading: false,
        );
      },
    ).onError(
      (error, stackTrace) {},
    );
  }
}
