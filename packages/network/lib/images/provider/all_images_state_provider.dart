import 'dart:async';

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
  bool isPagination = true;

  Future<void> allImages({
    // String? jwtToken,
    // required Map<String, int> queryParams,
    required bool isSearch,
    String? searchText,
  }) async {
    state = state.copyWith(isLoading: true);

    await allImagesRepository
        .allImagesRepo(
      queryParams: isSearch
          ? {
              'page': page,
              'limit': limit,
              // "filters[\$or][0][business_name][\$contains]": searchText,
              // "filters[\$or][1][first_name][\$contains]": searchText,
              // "filters[\$or][2][last_name][\$contains]": searchText,
              // "sort[0]": "business_name:asc",
              // "sort[1]": "first_name:asc",
            }
          : {
              'page': page,
              'limit': limit,
              // "sort[0]": "business_name:asc",
              // "sort[1]": "first_name:asc",
            },
      // jwtToken: jwtToken,
    )
        .then(
      (data) {
        listAllImages.clear();
        listAllImages.addAll(data.imagess!);
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
        print('LoadingData $page ${listAllImages.length}');
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
