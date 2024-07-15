import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/search/search.dart';
import 'package:network/category/data/model/all_category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.color,
    required this.ref,
    this.categoryData,
    this.homeCategory,
  });

  final MonixColors color;
  final WidgetRef ref;
  final List<CategoryDataModel>? categoryData;
  final List<CategoryDataModel>? homeCategory;

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(tempLoadingProvider.notifier).state;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 20.h,
            left: 20.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringManager.category,
                style: TextStyle(
                  color: color.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  context.push(AppRoutesPath.allCategoryScreen,
                      extra: categoryData);
                },
                child: Text(
                  StringManager.viewAll,
                  style: TextStyle(
                    color: color.grey500,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 120.w,
          child: !isLoading
              ? homeCategory != null
                  ? ListView.separated(
                      itemCount: homeCategory!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        right: 20.h,
                        left: 20.h,
                      ),
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 16.w,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                           InkWell(
                            onTap: () => context.push(AppRoutesPath.subCategoryScreen,
                  extra: categoryData?[index].id ?? ''),
                             child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                               child: CachedNetworkImage(
                                  imageUrl:
                                      "${StringManager.imageUrl}${homeCategory![index].image}",
                                      height: 80.w,
                                      width: 80.w,
                                      fit: BoxFit.cover,
                                ),
                             ),
                           ),
                            SizedBox(
                              height: 12.w,
                            ),
                            Text(
                              homeCategory![index].name??'',
                              style: TextStyle(
                                color: color.grey500,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        );
                      },
                    )
                  : Text(
                      'No Data',
                      style: TextStyle(
                        color: color.white,
                      ),
                    )
              : PrimaryShimmerEffect(shimmerHeight: 60.w),
        ),
      ],
    );
  }
}
