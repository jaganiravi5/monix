import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/monix.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/screens/search/search.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/images/provider/all_images_provider.dart';
import 'package:network/network.dart';

import '../../router/routes_name.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: const SearchScreen(),
        state: state,
      );

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  bool isPortraitSelected = false;
  List<ImagesDataModel>? imagesData;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getAllImages(type: 'post');
      // getAllCategory(ref: ref);
    });
    super.initState();
  }

  Future<void> getAllImages({required String type}) async {
    ref.read(allImagesDataProvider.notifier).page = 1;
    ref.read(allImagesDataProvider.notifier).isPagination = true;

    await ref.read(allImagesDataProvider.notifier).allImages(
          isSearch: false,
          searchText: '',
          type: type,
          isTrending: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    final searchedList =
        ref.watch(allImagesDataProvider.notifier).getSearchsubCat();
    final trendindData =
        ref.watch(allImagesDataProvider.notifier).getAllImages();
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        color: color,
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        title: StringManager.exploreImg,
        text: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            StringManager.exploreImg,
            style: TextStyle(
              color: color.white,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leadingWidth: 12.w,
        icon: icons.menu.svg(
          width: 12.w,
          height: 12.w,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          //   top: 20.w,
          left: 20.w,
          right: 20.w,
          // bottom: 50.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.w,
              ),
              Consumer(
                builder: (context, ref, child) {
                  return SearchBarField(
                    controller: searchController,
                    hintText: StringManager.search,
                    onChanged: (value) async {
                      await _onSearch(value: value, ref: ref);
                    },
                    onSearchTap: () async {
                      if (searchController.text.isNotEmpty) {
                        // await _searchClientApiCall();
                      }
                    },
                    onClear: () {
                      // _searchClientList.clear();
                      searchedList.clear();
                      searchController.clear();
                      setState(() {});
                      ref.read(searchTextProvider.notifier).state = '';
                    },
                  );
                },
              ),
              SizedBox(
                height: 22.w,
              ),
              // ImageSizeWidget(
              //   isTitle: false,
              //   onPortraitClick: () {
              //     isPortraitSelected = !isPortraitSelected;
              //   },
              //   onSquareClick: () {
              //     isPortraitSelected = !isPortraitSelected;
              //   },
              //   portraitSelected: isPortraitSelected,
              // ),
              searchController.text.isNotEmpty
                  ? searchedList.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: color.bgSolidColor,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.w),
                          child: ListView.separated(
                            itemCount: searchedList.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 16.w,
                              );
                            },
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => context.push(
                                  AppRoutesPath.imageListScreen,
                                  extra: searchedList[index].subcategory?.id,
                                ),
                                child: Row(
                                  children: [
                                    icons.search.svg(
                                      height: 20.w,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Text(
                                      searchedList[index].subcategory?.name ??
                                          '',
                                      style: TextStyle(
                                        color: color.grey500,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : Text(
                          'No Data Found!',
                          style: TextStyle(
                            color: color.grey500,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                  : AllImagesWidget(
                      isTitle: true,
                      titleText: StringManager.trendingImages,

                      imagesDataModel: trendindData,
                      portraitSel: isPortraitSelected,
                      onPortraitTap: () {
                        if (isPortraitSelected == false) {
                          isPortraitSelected = true;
                          getAllImages(type: StringManager.reel);
                        }
                        setState(() {});
                      },
                      onSquareTap: () {
                        if (isPortraitSelected == true) {
                          isPortraitSelected = false;
                          getAllImages(type: StringManager.post);
                        }
                        setState(() {});
                      },
                      // onImageTap: () {},
                      // isLoading: ref.watch(tempLoadingProvider.notifier).state
                    ),
              SizedBox(
                height: 20.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

/*
   * _onSearch is a function that is called when the search field is changed
   * and a search api is called after a debounce of 500 milliseconds
   */
  Future<void> _onSearch(
      {required String value, required WidgetRef ref}) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 30), () async {
      ref.read(searchTextProvider.notifier).state = value;
      if (value.isEmpty) {
        // imagesData?.clear();
      } else if (value.length >= 3) {
        await getSearchImages(type: '', searchText: value);
        // await _searchClientApiCall();
      }
      setState(() {});
    });
  }

  Future<void> getSearchImages(
      {required String type, required String searchText}) async {
    ref.read(allImagesDataProvider.notifier).page = 1;
    ref.read(allImagesDataProvider.notifier).isPagination = true;

    await ref
        .read(allImagesDataProvider.notifier)
        .allImages(isSearch: true, searchText: searchText, type: type);
    final data = ref.watch(allImagesDataProvider.notifier).getAllImages();
  }
}
