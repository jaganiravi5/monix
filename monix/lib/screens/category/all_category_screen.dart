import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/search/search.dart';
import 'package:network/category/data/model/all_category_model.dart';
import 'package:network/category/provider/all_category_provider.dart';

class AllCategoryScreen extends ConsumerStatefulWidget {
  const AllCategoryScreen({
    super.key,
    this.categoryData,
  });
  final List<CategoryDataModel>? categoryData;

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: AllCategoryScreen(
          categoryData: state.extra as List<CategoryDataModel>?,
        ),
        state: state,
      );

  @override
  ConsumerState<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends ConsumerState<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        color: color,
        title: StringManager.allCategory,
        leadingWidth: 44.w,
        icon: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: color.white,
            size: 28.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllCategoryWidget(
              categoryData: widget.categoryData,
              isLoading: ref.watch(allCategoryDataProvider).isLoading,
              onTap: (index) => context.push(AppRoutesPath.subCategoryScreen,
                  extra: widget.categoryData?[index].id ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}

class AllCategoryWidget extends StatelessWidget {
  const AllCategoryWidget({
    super.key,
    required this.onTap,
    required this.isLoading,
    this.categoryData,
  });

  final void Function(int) onTap;
  final bool isLoading;
  final List<CategoryDataModel>? categoryData;

  @override
  Widget build(BuildContext context) {
    print("::::::LENGTH-CATEGORY:::::${categoryData?.length}");

    final color = Theme.of(context).monixColors;
    return Padding(
      padding: EdgeInsets.only(
        right: 20.h,
        left: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              childAspectRatio: 9 / 11,
              mainAxisSpacing: 4,
            ),
            itemCount: categoryData?.length,
            padding: EdgeInsets.only(bottom: 30.h),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => onTap(index),
                child: !isLoading
                    ? Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${StringManager.imageUrl}${categoryData![index].image}",
                              height: 80.w,
                              width: 80.w,
                              fit: BoxFit.cover,
                            ),
                            // child: Image.network(
                            //     'https://thumbs.dreamstime.com/b/man-monkey-his-back-holding-key-man-monkey-his-back-holding-key-man-wearing-gold-crown-has-315343831.jpg',
                            //     width: 80.h,
                            //     height: 80.h,
                            //     alignment: Alignment.center,
                            //     fit: BoxFit.cover),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            categoryData?[index].name ?? '',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: color.white,
                            ),
                          )
                        ],
                      )
                    : PrimaryShimmerEffect(
                        shimmerHeight: 30.w,
                        // borderRad: 100.r,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
