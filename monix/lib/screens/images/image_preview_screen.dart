import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/screens/images/low_quality_btn.dart';
import 'package:monix/screens/images/no_watermark_btn.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({super.key});
  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: const ImagePreviewScreen(),
        state: state,
      );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://images1.dnaindia.com/images/DNA-EN/900x1600/2023/6/1/1685617819241_krishna.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: color.bgColor.withOpacity(0.8),
          ),
          Positioned(
            left: 18.w,
            top: 50.w,
            right: 18.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: color.white,
                      size: 24.w,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'Hanuman',
                      style: TextStyle(
                        color: color.white,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 108.w,
                  child: CommonSolidButton(
                    title: "share",
                    onButtonClick: () {},
                    isBorder: true,
                    borderRadius: BorderRadius.circular(40.r),
                    borderColor: color.white.withOpacity(0.18),
                    borderWidth: 1.w,
                    fillColor: color.white.withOpacity(0.2),
                    icon: Icon(
                      Icons.share,
                      color: color.white,
                    ),
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: color.white),
                    padding: EdgeInsets.symmetric(vertical: 9.w),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 240.w,
            bottom: 240.w,
            left: 20.w,
            right: 20.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: color.white,
                      spreadRadius: 5,
                      blurRadius: 48,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.network(
                  'https://images1.dnaindia.com/images/DNA-EN/900x1600/2023/6/1/1685617819241_krishna.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 35.w,
            left: 20.w,
            right: 20.w,
            child: Column(
              children: [
                LowQualityBtn(),
                SizedBox(height: 14.w,),
               NoWatermarkBtn()
              ],
            )
          )
        ],
      ),
    );
  }
}
