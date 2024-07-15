import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/router/routes_name.dart';
import 'package:network/network.dart';
import 'package:network/sub_category/data/model/sub_category_model.dart';
import 'package:network/sub_category/provider/provider.dart';

class SubCategoryScreen extends ConsumerStatefulWidget {
  const SubCategoryScreen({
    super.key,
    this.catId,
  });
  final String? catId;

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: SubCategoryScreen(
          catId: state.extra as String?,
        ),
        state: state,
      );

  @override
  ConsumerState<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends ConsumerState<SubCategoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getSubCategory(catId: widget.catId ?? '');
      // _nativeAds.loadNativeAds(ref: ref);
    });
  }

  Future<void> getSubCategory({required String catId}) async {
    await ref
        .read(subCategoryDataProvider.notifier)
        .subCategory(catId: widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    final isLoading = ref.watch(subCategoryDataProvider).isLoading;
    final subCategoryData =
        ref.watch(subCategoryDataProvider.notifier).getsubCategory();
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        color: color,
        title: StringManager.subCategory,
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
            AllSubCategoryWidget(
              subCategoryData: subCategoryData,
              // categoryData: widget.categoryData,
              isLoading: isLoading,
              onTap: (index) => context.push(AppRoutesPath.imageListScreen,
                  extra: subCategoryData[index].id),
            ),
          ],
        ),
      ),
    );
  }
}

class AllSubCategoryWidget extends StatelessWidget {
  const AllSubCategoryWidget({
    super.key,
    required this.onTap,
    required this.isLoading,
    this.subCategoryData,
  });

  final void Function(int) onTap;
  final bool isLoading;
  final List<SubCategoryData>? subCategoryData;

  @override
  Widget build(BuildContext context) {
    print("::::::LENGTH-SUB::::CATEGORY:::::${subCategoryData?.length}");

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
            itemCount: subCategoryData?.length,
            padding: EdgeInsets.only(bottom: 30.h),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                highlightColor: Colors.transparent,
                onTap: () => onTap(index),
                child: !isLoading
                    ? subCategoryData != null && subCategoryData!.isNotEmpty
                        ? Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${StringManager.imageUrl}${subCategoryData![index].image}",
                                  height: 80.w,
                                  width: 80.w,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    height: 80.w,
                                    width: 80.w,
                                    color: color.bgSolidColor,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    height: 80.w,
                                    width: 80.w,
                                    color: Colors.grey.shade200,
                                    child: Icon(Icons.error),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                subCategoryData?[index].name ?? '',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: color.white,
                                ),
                              )
                            ],
                          )
                        : Text('No Data Found')
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
