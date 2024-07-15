import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PrimaryShimmerEffectDownloadImage extends StatelessWidget {
  final double shimmerHeight;
   final double shimmerWidth;
  final double? borderRad;

  const PrimaryShimmerEffectDownloadImage({
    Key? key,
    required this.shimmerHeight,
    required this.shimmerWidth,
    this.borderRad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Shimmer.fromColors(
      baseColor: color.bgSolidColor,
      highlightColor: color.bgColor,
      enabled: true,
      child: Container(
        //height: 50.h,
        width:shimmerWidth,
        height: shimmerHeight,
        // margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: color.white,
          borderRadius: BorderRadius.circular(borderRad ?? 10.r),
          boxShadow: [
            BoxShadow(
              color: color.secondary,
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          minVerticalPadding: shimmerHeight,
          onTap: () {},
          title: const Text(
            '',
          ),
          subtitle: const Text(''),
        ),
      ),
    );
  }
}
