import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/search/data/model/search_model.dart';
import 'package:network/search/data/model/search_state.dart';
import 'package:network/search/data/repository/search_repository.dart';
import 'package:network/sub_category/data/model/sub_category_model.dart';

class SearchDataNotifier extends StateNotifier<SearchState> {
  SearchDataNotifier(this.searchRepository) : super(SearchState());

  SearchRepository searchRepository;

  int page = 1;
  int limit = 18;
  List<SubCatData> listAllSearch = [];
  // List<SubCategoryData> listAllSearchData = [];
  bool isPagination = true;

  Future<void> allsearch({
    String? searchText,
  }) async {
    state = state.copyWith(isLoading: true);

    await searchRepository.searchRepo(queryParams: {
      'page': page,
      'limit': limit,
      // 'type': type,
      'search': searchText,
    }).then(
      (data) {
        print(":::::::::dataaaa$data");

        // if (isSearch) {
          // listAllSearchData.clear();
          // listAllSearchData.addAll(data.data!);
        // } else {
          listAllSearch.clear();
          listAllSearch.addAll(data.data!.subcategory!);
        // }

        print('LoadingData $page ${listAllSearch.length}');
        state = state.copyWith(
            searchModel: data, isLoading: false, isLoadingMore: false);
      },
    ).onError(
      (error, stackTrace) {
        print("::::::ERRR#${error}");
      },
    );
  }

  List<SubCatData> getAllSearches() {
    return listAllSearch;
  }

  // List<SearchModel> getSearchsubCat() {
  //   // Set<String> subCategorySet = {};
  //   // List<SearchModel> uniqueImagesList = [];
  //   // for (var image in listAllSearchData) {
  //   //   if (!subCategorySet.contains(image.data?.)) {
  //   //     subCategorySet.add(image.subcategory?.name ?? '');
  //   //     uniqueImagesList.add(image);
  //   //   }
  //   // }

  //   return uniqueImagesList;
  // }

  // void updateCustomer({required int index, required AllCustomerData customerData}) {
  //   listAllImages[index] = customerData;
  // }

  // void removeItem({required int index}) {
  //   listAllData.remove(index);
  // }

  // void addCustomer({required AllCustomerData customerData}) {
  //   listAllImages.add(customerData);
  // }

  // Future<void> fetchNextBatch({
  //   String? jwtToken,
  //   required Map<String, int> queryParams,
  // }) async {
  //   page++;
  //   print('PageNo $page ${listAllSearch.length}');

  //   state = state.copyWith(isLoading: false, isLoadingMore: true);

  //   await allImagesRepository.allImagesRepo(
  //     queryParams: {
  //       "pagination[page]": page,
  //       "pagination[pageSize]": limit,
  //       "sort[0]": "business_name:asc",
  //       "sort[1]": "first_name:asc",
  //     },
  //     // jwtToken: jwtToken,
  //   ).then(
  //     (data) {
  //       if (data.imagess!.length < limit) {
  //         isPagination = false;
  //       }
  //       state = state.copyWith(isLoading: false, isLoadingMore: false);
  //       listAllSearch.addAll(data.imagess!);
  //       print('LoadingData:::::::IMG $page ${listAllSearch.length}');
  //       state = state.copyWith(
  //         allImages: data,
  //         isLoading: false,
  //       );
  //     },
  //   ).onError(
  //     (error, stackTrace) {},
  //   );
  // }

}
