import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:monix_assets/monix_assets.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.color,
    required this.title,
    this.icon,
    this.leadingWidth,
    this.text,
  });

  final MonixColors color;
  final String title;
  final Widget? icon;
  final double? leadingWidth;
  final Widget? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          toolbarHeight: 74.h,
          centerTitle: false,
          titleSpacing: icon != null ? 2.h : 55.h,
          leading: icon,
          leadingWidth: leadingWidth ?? 0,
          actions: [
            SizedBox(
              width: 86.h,
              height: 38.h,
              child: CommonButton(
                icon: icons.idea.svg(
                  width: 18.w,
                  height: 30.w,
                  fit: BoxFit.fitHeight,
                ),
                title: StringManager.idea,
                borderRadius: BorderRadius.circular(
                  8.w,
                ),
                textStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: color.white,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 9.h,
                ),
                onButtonClick: () {},
              ),
            ),
            SizedBox(
              width: 20,
            ),
            // SizedBox(
            //   width: 20.h,
            // )
          ],
          title: text ??
              Text(
                title,
                style: TextStyle(
                  color: color.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
          backgroundColor: color.bgColor,
        ),
        Divider(
          height: 1.h,
          thickness: 1.h,
          color: color.grey500.withOpacity(0.3),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(75.h);
}
