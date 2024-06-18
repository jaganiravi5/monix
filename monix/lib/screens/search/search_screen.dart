import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/monix.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/screens/search/search.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:network/network.dart';

import '../../router/routes_name.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
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

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
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
              AllImagesWidget(
                  isTitle: false,
                  portraitSel: isPortraitSelected,
                  onPortraitTap: () {
                    isPortraitSelected = !isPortraitSelected;
                    setState(() {});
                  },
                  onSquareTap: () {
                    isPortraitSelected = !isPortraitSelected;
                    setState(() {});
                  },
                  onImageTap: () {},
                  isLoading: ref.watch(tempLoadingProvider.notifier).state),
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
  Future<void> _onSearch({required String value, required WidgetRef ref}) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 30), () async {
      ref.read(searchTextProvider.notifier).state = value;
      if (value.isEmpty) {
        // _searchClientList.clear();
      } else if (value.length >= 3) {
        // await _searchClientApiCall();
      }
      setState(() {});
    });
  }
}
