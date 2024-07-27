import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/ads/data/model/ads_state.dart';
import 'package:network/ads/data/repository/ads_repository.dart';
import 'package:network/category/data/model/all_category_model.dart';

class AdsDataNotifier extends StateNotifier<AdsState> {
  AdsDataNotifier(this.adsRepository) : super(AdsState());

  AdsRepository adsRepository;

  int page = 1;
  int limit = 18;
  List<CategoryDataModel> listAllData = [];
  List<CategoryDataModel> homePageCategoryData = [];

  Future<void> adsData(
      // String? jwtToken,
      // required Map<String, int> queryParams,
      // required bool isSearch,
      // String? searchText,
      ) async {
    state = state.copyWith(isLoading: true);

    await adsRepository
        .adsRepo(
           
            )
        .then(
      (data) {
        // print('LoadingData $page ${listAllData.length}');
        state = state.copyWith(
            adsModel: data, isLoading: false, isLoadingMore: false);
      },
    ).onError(
      (error, stackTrace) {},
    );
  }
}
