import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/common_utills/common_utills.dart';
import 'package:flutter/material.dart';

class NoWatermarkBtn extends StatelessWidget {
  const NoWatermarkBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).monixColors;
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 16.w,horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.w),
              gradient: CommonUtills.getGradient(context: context),
              boxShadow: [
                BoxShadow(
                  color: theme.secondary1.withOpacity(0.17),
                  spreadRadius: 5,
                  blurRadius: 48,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringManager.noWatermark,
                  style: TextStyle(
                    color: theme.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 91.w,
                  height: 31.w,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: theme.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_circle_fill_rounded,
                          color: theme.black,
                        ),
                        Text(
                          StringManager.watchAd,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(14.w),
              topLeft: Radius.circular(14.w),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 52.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.w),
                gradient: LinearGradient(
                  colors: [
                    theme.white.withOpacity(0.29),
                    theme.white.withOpacity(0.1),
                    Colors.transparent,
                  ], // Red to orange (adjust as needed)
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.1, 0.2],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
