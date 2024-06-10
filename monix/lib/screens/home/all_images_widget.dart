import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';

class AllImagesWidget extends StatelessWidget {
  const AllImagesWidget({super.key, required this.isTitle});
  final bool isTitle;

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
          isTitle
              ? Column(
                  children: [
                    Text(
                      StringManager.allImages,
                      style: TextStyle(
                        color: color.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                )
              : SizedBox.shrink(),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 20,
            padding: EdgeInsets.only(bottom: 90.h),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: color.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                      onTap: () {
                        context.push(AppRoutesPath.imagePreviewScreen);
                      },
                      splashColor: Colors.transparent,
                      child: Center(child: Text('data'))),
                ),
                elevation: 3,
              );
            },
          ),
        ],
      ),
    );
  }
}
