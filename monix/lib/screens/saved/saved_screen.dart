import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/screens/search/search.dart';
import 'package:monix_assets/monix_assets.dart';

import '../../router/custom_page_transition.dart';
import '../../router/routes_name.dart';
import '../home/home_screen.dart';

class SavedScreen extends ConsumerStatefulWidget {
  SavedScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: SavedScreen(),
        state: state,
      );

  @override
  ConsumerState<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends ConsumerState<SavedScreen> {
  final List<String> downloadedImage = ['jshs'];

  bool isPortraitSel = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        color: color,
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        title: StringManager.monixAi,
        text: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            StringManager.savedItems,
            style: TextStyle(
              color: color.white,
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leadingWidth: 12.w,
        icon: icons.menu.svg(
          width: 12.w,
          height: 12.w,
          fit: BoxFit.contain,
        ),
      ),
      body: Stack(
        children: [
          downloadedImage.isEmpty
              ? NoImageWidget(color: color)
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 70.w,
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: DownloadedImgWidget(
                      portraitSel: isPortraitSel,
                      isLoading: ref.watch(tempLoadingProvider.notifier).state,
                      onImgTap: () {},
                      onPortraitTap: () {
                        isPortraitSel = !isPortraitSel;
                        setState(() {});
                      },
                      onSquareTap: () {
                        isPortraitSel = !isPortraitSel;
                        setState(() {});
                      },
                    ),
                  ),
                ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 45.w,
              color: color.bgSolidColor,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.allDownloadImg,
                    style: TextStyle(
                      color: color.grey500,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    StringManager.deleteAll,
                    style: TextStyle(
                      color: color.secondary1,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadedImgWidget extends StatelessWidget {
  const DownloadedImgWidget({
    super.key,
    required this.onPortraitTap,
    required this.onSquareTap,
    required this.portraitSel,
    required this.onImgTap,
    required this.isLoading,
  });

  final void Function() onPortraitTap;
  final void Function() onSquareTap;
  final void Function() onImgTap;
  final bool portraitSel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Column(
      children: [
        ImageSizeWidget(
          isTitle: false,
          onPortraitClick: () => onPortraitTap(),
          onSquareClick: () => onSquareTap(),
          portraitSelected: portraitSel,
        ),
        SizedBox(
          height: 20.w,
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
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
            return !isLoading
                ? Card(
                    color: color.white,
                    elevation: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                          onTap: () => onImgTap(), splashColor: Colors.transparent, child: Center(child: Text('data'))),
                    ),
                  )
                : PrimaryShimmerEffect(shimmerHeight: 40.w);
          },
        ),
      ],
    );
  }
}

class NoImageWidget extends StatelessWidget {
  const NoImageWidget({
    super.key,
    required this.color,
  });

  final MonixColors color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icons.noImage.svg(),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${StringManager.noImg}. ",
              style: TextStyle(
                color: color.grey500,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "${StringManager.search}",
              style: TextStyle(
                color: color.white,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: color.white,
                decoration: TextDecoration.underline,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
