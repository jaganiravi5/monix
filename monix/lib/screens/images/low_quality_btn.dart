import 'package:common/app_string.dart';
import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/common_button.dart';
import 'package:flutter/material.dart';

class LowQualityBtn extends StatelessWidget {
  const LowQualityBtn({super.key, required this.onBtnTap});

  final void Function() onBtnTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return InkWell(
      onTap: () => onBtnTap(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 52.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.w), color: color.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringManager.lowQuatilyWatermark,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                color: color.black,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            SizedBox(
              width: 91.w,
              height: 31.h,
              child: CommonButton(
                title: StringManager.free,
                icon: Icon(
                  Icons.file_download_outlined,
                  color: color.white,
                  size: 17.w,
                ),
                onButtonClick: () {},
                borderRadius: BorderRadius.circular(7.w),
                padding: EdgeInsets.symmetric(
                  vertical: 6.w,
                  horizontal: 22.w,
                ),
                textStyle: TextStyle(color: color.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
