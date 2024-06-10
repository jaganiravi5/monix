import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewImagesWidget extends StatelessWidget {
  const NewImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
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
                StringManager.newImages,
                style: TextStyle(
                  color: color.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                StringManager.viewAll,
                style: TextStyle(
                  color: color.grey500,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
              padding: EdgeInsets.only(
              right: 20.h,
              left: 20.h,
              // top: 22.h,
            ),
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 12,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                height: 120.h,
                width: 120.h,
                decoration: BoxDecoration(
                  color: color.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
