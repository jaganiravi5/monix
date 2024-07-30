import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/ads/data/model/ads_state.dart';
import 'package:network/ads/data/repository/ads_repository.dart';
import 'package:network/category/data/model/all_category_model.dart';

class AdsDataNotifier extends StateNotifier<AdsState> {
  AdsDataNotifier(this.adsRepository) : super(AdsState());

  AdsRepository adsRepository;

  
  String adsId = '';
  String ytUrl = '';
  String instaUrl='';
  String wpUrl ='';
  String interAndroidSkipBtn = '';
  String interIosSkipBtn = '';

  Future<void> adsData(
      // String? jwtToken,
      // required Map<String, int> queryParams,
      // required bool isSearch,
      // String? searchText,
      ) async {
    state = state.copyWith(isLoading: true);

    await adsRepository.adsRepo().then(
      (data) {
        // print('LoadingData $page ${listAllData.length}');
        // adsId=data.!;
        instaUrl=data.instagramUrl!;
        ytUrl=data.ytUrl!;
        wpUrl=data.wpUrl!;
        interAndroidSkipBtn=data.interAndroidSkipBtn!;
        interIosSkipBtn=data.interIosSkipBtn!;
        print("------>>>>>>ADSDATA<<<<<<<-------$adsId");
        state = state.copyWith(
            adsModel: data, isLoading: false, isLoadingMore: false);
      },
    ).onError(
      (error, stackTrace) {},
    );
  }
}
