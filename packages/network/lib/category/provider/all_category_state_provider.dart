import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/category/data/model/all_category_model.dart';

import '../data/model/all_category_state.dart';
import '../data/repository/all_category_repository.dart';

class AllCategoryDataNotifier extends StateNotifier<AllCategoryState> {
  AllCategoryDataNotifier(this.allCategoryRepository) : super(AllCategoryState());

  AllCategoryRepository allCategoryRepository;

  int page = 1;
  int limit = 18;
  List<CategoryDataModel> listAllData = [];
  bool isPagination = true;

  Future<void> allCategory({
    // String? jwtToken,
    required Map<String, int> queryParams,
    required bool isSearch,
    String? searchText,
  }) async {
    state = state.copyWith(isLoading: true);

    await allCategoryRepository
        .allCategoryRepo(
      // queryParams: isSearch
      //     ? {
      //   "pagination[page]": page,
      //   "pagination[pageSize]": limit,
      //   "filters[name][\$contains]": searchText,
      //   "sort[0]": "name:asc",
      //
      //
      // }
      //     : {
      //   "pagination[page]": page,
      //   "pagination[pageSize]": limit,
      //   "sort[0]": "name:asc",
      // },
      // jwtToken: jwtToken,
    )
        .then(
      (data) {
        listAllData.clear();
        listAllData.addAll(data.categories!);
        // print('LoadingData $page ${listAllData.length}');
        state = state.copyWith(allCategory: data, isLoading: false, isLoadingMore: false);
      },
    ).onError(
      (error, stackTrace) {},
    );
  }

  List<CategoryDataModel> getAllCategory() {
    return listAllData;
  }
//
// void updateProduct({required int index, required CategoryDataModel CategoryData}) {
//   listAllData[index] = CategoryData;
// }

// void addProduct({required CategoryDataModel CategoryData}) {
//   listAllData.add(CategoryData);
// }

// Future<void> fetchNextBatch({
//   String? jwtToken,
//   required Map<String, int> queryParams,
// }) async {
//   page++;
//   print('PageNo $page');
//
//   state = state.copyWith(isLoading: false, isLoadingMore: true);
//
//   await allCategoryRepository.allCategoryRepo(
//     queryParams: {
//       "pagination[page]": page,
//       "pagination[pageSize]": limit,
//       "sort[0]": "name:asc",
//     },
//     jwtToken: jwtToken,
//   ).then(
//         (data) {
//       if (data.data!.length < limit) {
//         isPagination = false;
//       }
//       state = state.copyWith(isLoading: false, isLoadingMore: false);
//       listAllData.addAll(data.data!);
//       print('LoadingData $page ${listAllData.length}');
//       state = state.copyWith(
//         allCategory: data,
//         isLoading: false,
//       );
//     },
//   ).onError(
//         (error, stackTrace) {},
//   );
// }
}
