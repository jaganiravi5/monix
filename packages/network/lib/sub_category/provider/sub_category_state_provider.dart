import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/category/data/model/all_category_model.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/sub_category/data/model/sub_category_model.dart';
import 'package:network/sub_category/provider/provider.dart';

import '../data/model/sub_category_state.dart';
import '../data/repository/sub_category_repository.dart';

class SubCategoryDataNotifier extends StateNotifier<SubCategoryState> {
  SubCategoryDataNotifier(this.subCategoryRepository)
      : super(SubCategoryState());

  SubCategoryRepository subCategoryRepository;

  int page = 1;
  int limit = 18;
  List<SubCategoryData> listAllData = [];
  bool isPagination = true;

  Future<void> subCategory({String? catId}) async {
    state = state.copyWith(isLoading: true);

    await subCategoryRepository
        .subCategoryRepo(catId: catId
            )
        .then(
      (data) {
        listAllData.clear();
        listAllData.addAll(data.subcategory!);

        // print('LoadingData $page ${listAllData.length}');
        state = state.copyWith(
            subCategory: data, isLoading: false, isLoadingMore: false);
      },
    ).onError(
      (error, stackTrace) {},
    );
  }

  List<SubCategoryData> getsubCategory() {
    print("::LENGTH OF SUBCAT ${listAllData.length}");
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
