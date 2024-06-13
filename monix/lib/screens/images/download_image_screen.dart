import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/custom_page_transition.dart';
import 'image_preview_screen.dart';
import 'low_quality_btn.dart';
import 'no_watermark_btn.dart';

class DownloadImageScreen extends StatelessWidget {
  const DownloadImageScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const DownloadImageScreen(),
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
          ImagePreviewAppBar(
            color: color,
            onSuffixClick: () {
              //TODO : share on What'sapp
            },
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
                  CommonButton(
                    title: StringManager.downloadImg,
                    icon: Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Icon(
                        Icons.file_download_outlined,
                        color: color.white,
                        size: 24.w,
                      ),
                    ),
                    onButtonClick: () {},
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: color.white,
                    ),
                  )
                  // LowQualityBtn(),
                  // SizedBox(height: 14.w,),
                  // NoWatermarkBtn()
                ],
              ))
        ],
      ),
    );
  }
}
