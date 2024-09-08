import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/common_utills/common_utills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/ads/provider/ads_provider.dart';

class NoWatermarkBtn extends StatefulWidget {
  const NoWatermarkBtn({
    super.key,
    required this.onBtnTap,
    required this.ref,
    required this.isLoad,
  });

  final void Function() onBtnTap;
  final bool isLoad;
  final WidgetRef ref;

  @override
  State<NoWatermarkBtn> createState() => _NoWatermarkBtnState();
}

class _NoWatermarkBtnState extends State<NoWatermarkBtn> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).monixColors;
    return Opacity(
      opacity: widget.isLoad ? 0.4 : 1,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              // height: 52.w,
              // width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.w),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        StringManager.noWatermark,
                        style: TextStyle(
                          color: theme.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                          width: 104.w,
                          height: 30.w,
                          child: widget.ref
                          .read(adsDataProvider.notifier)
                          .downloadImageRewardAndroidBtn
                          .isNotEmpty
                      ? Container(
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
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  StringManager.watchAd,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                              ],
                            ),
                          ):SizedBox.shrink()
                        )
                   ,
                ],
              ),
            ),
            InkWell(
              onTap: () => widget.isLoad ? () {} : widget.onBtnTap(),
              child: ClipRRect(
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
            ),
          ],
        ),
      ),
    );
  }
}
