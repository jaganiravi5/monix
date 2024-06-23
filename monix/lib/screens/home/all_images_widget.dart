import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';
import 'package:network/images/data/model/all_images_model.dart';

import 'home_screen.dart';

class AllImagesWidget extends StatelessWidget {
  const AllImagesWidget({
    super.key,
    required this.isTitle,
    required this.portraitSel,
    required this.onPortraitTap,
    required this.onSquareTap,
    required this.onImageTap,
    required this.isLoading,  this.imagesDataModel,
  });

  final bool isTitle;
  final bool portraitSel;
  final void Function() onPortraitTap;
  final void Function() onSquareTap;
  final void Function() onImageTap;
  final bool isLoading;
  final List<ImagesDataModel>? imagesDataModel;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTitle
            ? Column(
                children: [
                  Text(
                    StringManager.allImages,
                    style: TextStyle(
                      color: color.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              )
            : SizedBox.shrink(),
        ImageSizeWidget(
          isTitle: false,
          onPortraitClick: () => onPortraitTap(),
          onSquareClick: () => onSquareTap(),
          portraitSelected: portraitSel,
        ),
        SizedBox(
          height: 24.w,
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: portraitSel ? 9 / 16 : 1,
          ),
          itemCount: 20,
          padding: EdgeInsets.only(bottom: 90.h),
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return isLoading
                ? PrimaryShimmerEffect(shimmerHeight: 50.w)
                : Card(
                    color: color.white,
                    elevation: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                          onTap: () => onImageTap(),
                          splashColor: Colors.transparent,
                          child: Center(child: Text('data'))),
                    ),
                  );
          },
        )
      ],
    );
  }
}
