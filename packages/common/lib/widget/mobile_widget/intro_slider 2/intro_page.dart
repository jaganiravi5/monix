
import 'package:common/common.dart';
import 'package:flutter/material.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
    required this.descBody,
  });

  final String title;
  final String desc;
  final Image image;
  final String descBody;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).monixColors;
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.w),
              child: image,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 420.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, theme.bgColor, theme.bgColor],
                  stops: [0.0, 0.3, 0.4],
                  // Color transitions at 0%, 50%, and 100% of the gradient
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.mirror // Mirror the gradient if container size exceeds its dimensions
                  ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          color: theme.white,
                        ),
                      ),
                      SizedBox(
                        height: 14.sp,
                      ),
                      Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: theme.grey500,
                        ),
                      ),
                      SizedBox(
                        height: 30.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 54,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                //   child: CommonButton(
                //     title: StringManager.getStarted,
                //     onButtonClick: () {},
                //   ),
                // ),

                // Stack(
                //   children: [
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       height: 52.w,
                //       padding: EdgeInsets.symmetric(vertical: 16.w),
                //       decoration: BoxDecoration(
                //         //     borderRadius: BorderRadius.circular(12),
                //         // color: theme.white,
                //         borderRadius: BorderRadius.circular(14.w),
                //         gradient: CommonUtills.getGradient(context: context),
                //
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.5),
                //             spreadRadius: 5,
                //             blurRadius: 7,
                //             offset: Offset(0, 3),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //           child: Text(
                //         StringManager.getStarted,
                //         style: TextStyle(
                //           color: theme.white,
                //           fontSize: 20,
                //           fontWeight: FontWeight.w600
                //         ),
                //       )),
                //     ),
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       padding: EdgeInsets.symmetric(horizontal: 2.w),
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(14.w),
                //           topRight: Radius.circular(14.w),
                //         ),
                //         clipBehavior: Clip.hardEdge,
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           height: 10.w,
                //           decoration: BoxDecoration(
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.white.withOpacity(0.01),
                //                 blurRadius: 4,
                //                 offset: const Offset(0, 0),
                //               ),
                //               BoxShadow(
                //                 color: Colors.white.withOpacity(0.09),
                //                 blurRadius: 4,
                //                 offset: const Offset(0, -4),
                //               ),
                //               BoxShadow(
                //                 color: Colors.white.withOpacity(0.2),
                //                 blurRadius: 4,
                //                 offset: const Offset(0, -7),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 24.w,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
