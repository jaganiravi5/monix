import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/images/images_list_screen.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const AllCategoryScreen(),
        state: state,
      );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        color: color,
        title: StringManager.allCategory,
        leadingWidth: 44.w,
        icon: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: color.white,
            size: 28.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllCategoryWIdget(
              onTap: () => context.push(AppRoutesPath.imageListScreen),
            ),
          ],
        ),
      ),
    );
  }
}

class AllCategoryWIdget extends StatelessWidget {
  const AllCategoryWIdget({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Padding(
      padding: EdgeInsets.only(
        right: 20.h,
        left: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              childAspectRatio: 9 / 11,
              mainAxisSpacing: 4,
            ),
            itemCount: 20,
            padding: EdgeInsets.only(bottom: 30.h),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => onTap(),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                          'https://thumbs.dreamstime.com/b/man-monkey-his-back-holding-key-man-monkey-his-back-holding-key-man-wearing-gold-crown-has-315343831.jpg',
                          width: 80.h,
                          height: 80.h,
                          alignment: Alignment.center,
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Data",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: color.white,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    ;
  }
}
