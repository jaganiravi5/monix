import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monix_assets/monix_assets.dart';

class PrimaryBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const PrimaryBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PrimaryBottomNavigation> createState() => _PrimaryBottomNavigationState();
}

class _PrimaryBottomNavigationState extends State<PrimaryBottomNavigation> {
  // final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).monixColors;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 18.w,
      ),
      decoration: BoxDecoration(
        color: colors.bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onTap(0);
              });
            },
            child: _menuItem(
              content: context,
              isBoxShadow: widget.currentIndex == 0 ? true : false,
              title: StringManager.home,
              icon: widget.currentIndex == 0
                  ? icons.home.svg(width: 24.w, height: 24.w, color: colors.secondary1)
                  : icons.homeUnfill.svg(
                      width: 24.w,
                      height: 24.w,
                      color: colors.grey500,
                    ),
              isCurrentIndex: widget.currentIndex == 0,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onTap(1);
              });
            },
            child: _menuItem(
              isBoxShadow: widget.currentIndex == 1 ? true : false,
              content: context,
              title: StringManager.search,
              icon: widget.currentIndex == 1
                  ? icons.searchFill.svg(color: colors.secondary1)
                  : icons.search.svg(
                      color: colors.grey500,
                    ),
              isCurrentIndex: widget.currentIndex == 1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onTap(2);
              });
            },
            child: _menuItem(
              isBoxShadow: widget.currentIndex == 2 ? true : false,
              content: context,
              title: StringManager.monixAi,
              icon: widget.currentIndex == 2
                  ? icons.monixAiFill.svg(
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.cover,
                      color: widget.currentIndex == 2 ? colors.secondary1 : colors.grey500,
                    )
                  : icons.monixAi.svg(
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.cover,
                      color: widget.currentIndex == 2 ? colors.secondary1 : colors.grey500,
                    ),
              isCurrentIndex: widget.currentIndex == 2,
            ),
          ),
          // sharedPreferenceHelper.roleId == UserRolesConst.stocks ||
          //         sharedPreferenceHelper.roleId == UserRolesConst.admin
          //     ?
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onTap(3);
              });
            },
            child: _menuItem(
              content: context,
              isBoxShadow: widget.currentIndex == 3 ? true : false,
              title: StringManager.saved,
              icon: widget.currentIndex == 3
                  ? icons.savedFill.svg(
                      color: colors.secondary1,
                    )
                  : icons.saved.svg(
                      color: colors.grey500,
                    ),
              isCurrentIndex: widget.currentIndex == 3,
            ),
          )
          // : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _menuItem(
      {required Widget icon,
      required String title,
      required bool isCurrentIndex,
      required BuildContext content,
      required bool isBoxShadow}) {
    final color = Theme.of(context).monixColors;
    return SizedBox(
      // height: 40.w,
      // width: 40.w,
      child: Container(
        // height: 34.w,
        // width: 34.w,

        child: Column(
          children: [
            icon,
            SizedBox(
              height: 5.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isCurrentIndex ? color.secondary1 : color.grey500,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: isBoxShadow ? color.secondary1.withOpacity(0.17) : color.bgColor,
            spreadRadius: 5,
            blurRadius: 48,
            offset: const Offset(0, 4),
          ),
        ]),
      ),
    );
  }
}
