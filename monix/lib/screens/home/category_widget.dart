import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.color,
  });

  final MonixColors color;

  @override
  Widget build(BuildContext context) {
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
                  context.push(AppRoutesPath.allCategoryScreen);
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
          child: ListView.separated(
            itemCount: 4,
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
                  Container(
                    height: 71.w,
                    width: 71.w,
                    decoration: BoxDecoration(color: color.white, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Text(
                    'Hanuman',
                    style: TextStyle(
                      color: color.grey500,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
